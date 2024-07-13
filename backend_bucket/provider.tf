terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.37.0"
    }
  }
}

provider "google" {
  region      = "<region>"
  project     = "<project-id>"
  credentials = file("/path/to/credentials")
}
