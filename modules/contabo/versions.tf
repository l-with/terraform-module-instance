terraform {
  required_version = ">= 1.3"
  required_providers {
    contabo = {
      source  = "contabo/contabo"
      version = "~> 0.1"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.4"
    }
  }
}
