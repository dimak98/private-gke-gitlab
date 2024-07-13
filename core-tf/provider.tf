terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.37.0"
    }
  }

  backend "gcs" {
    bucket = "<bucket-name>"
    prefix = "terraform/state"
  }
}

provider "google" {
  region      = var.region
  project     = var.project_id
  credentials = file("key.json")
}
