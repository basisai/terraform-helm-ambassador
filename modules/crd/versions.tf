terraform {
  required_version = ">= 0.15"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.6"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 2.0"
    }
  }
}
