terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.9.0"
    }
  }
}

provider "google" {
  project = "terraform-gcp-438010"
  region = "us-central1"
  credentials = file("terraform-gcp-438010-69b5ce325a5a.json")
}