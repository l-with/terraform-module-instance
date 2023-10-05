terraform {
  required_version = ">= 1.3"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.22.2"
    }
    http = {
      source = "hashicorp/http"
      version = "~> 3.4.0"
    }
  }
}
