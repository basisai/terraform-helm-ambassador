terraform {
  required_version = ">= 0.15"

  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = ">= 1.13"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 2.0"
    }
  }
}
