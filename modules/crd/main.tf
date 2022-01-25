data "http" "manifest" {
  count = var.yaml_manifest == null ? 1 : 0

  url = "https://app.getambassador.io/yaml/emissary/${var.manifest_version}/emissary-crds.yaml"
}

locals {
  manifest = coalesce(var.yaml_manifest, data.http.manifest[0].body)
}

data "kubectl_file_documents" "manifest" {
  content = var.image_replace != null ? replace(local.manifest, "image: docker.io/emissaryingress/emissary", "image: ${var.image_replace}") : local.manifest
}

resource "kubectl_manifest" "manifest" {
  for_each = data.kubectl_file_documents.manifest.manifests

  yaml_body = each.value
}
