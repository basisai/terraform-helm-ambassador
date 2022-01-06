data "http" "manifest" {
  count = var.yaml_manifest == null ? 1 : 0

  url = "https://app.getambassador.io/yaml/emissary/${var.manifest_version}/emissary-crds.yaml"
}

locals {
  # For some reason, the generated file uses `---\n` to add in comments too. We will ignore those.
  manifest_raw = [for item in split("---\n", coalesce(var.yaml_manifest, data.http.manifest[0].body)) : try(yamldecode(item), null)]

  manifest = { for item in local.manifest_raw : join(".", [
    item.apiVersion,
    item.kind,
    lookup(item.metadata, "namespace", "default"),
    item.metadata.name,
  ]) => item if item != null }
}

resource "kubernetes_manifest" "crds" {
  for_each = local.manifest

  manifest = each.value

  field_manager {
    # force field manager conflicts to be overridden
    force_conflicts = true
  }
}
