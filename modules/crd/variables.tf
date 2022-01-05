variable "manifest_version" {
  description = "Version of the CRDs to install"
  type        = string
  default     = "2.1.0"
}

variable "yaml_manifest" {
  description = "Override the YAML manifest instead of the one from the usual URL"
  type        = string
  default     = null
}
