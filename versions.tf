terraform {
  required_version = ">= 0.13"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 1"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "~> 1.13"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 2.0"
    }
  }
}
