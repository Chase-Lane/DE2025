terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.18.0"
    }
  }
}

provider "google" {
  credentials = file("./keys/my-creds.json")
  project = "direct-tribute-447716-v7"
  region  = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "direct-tribute-447716-terra-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}