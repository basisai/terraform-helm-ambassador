terraform {
  version = ">= 0.13"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 1"
    }
  }
}
