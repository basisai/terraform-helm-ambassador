module "crd" {
  source = "./modules/crd"

  count = var.manage_crd ? 1 : 0

  manifest_version = var.image_tag
  yaml_manifest    = var.crd_manifest
}
