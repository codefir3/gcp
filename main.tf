/*
provider "google" {
  project     = "terraform-gcp-438010"
  region      = "us-central1"
#  GOOGLE_CREDENTIALS = file("terraform-gcp-438010-88da8837c7aa.json")
  credentials = file("terraform-gcp-438010-69b5ce325a5a.json")
#  GOOGLE_BACKEND_CREDENTIALS = file("terraform-gcp-438010-69b5ce325a5a.json")
    
}

resource "google_storage_bucket" "learn-bucket123" {
  project = "terraform-gcp-438010"
  name          = "learn-bucket123"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"  
# credentials = file("terraform-gcp-438010-69b5ce325a5a.json")
  
}


terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }

  backend "gcs" {
    bucket  = "learn-bucket123"
    prefix  = "terraform/state"
    credentials = "terraform-gcp-438010-69b5ce325a5a.json"
     
  }
  
}


data "terraform_remote_state" "terraform-gcp-438010" {
  backend = "gcs"
  config = {
    bucket  = "learn-bucket123"
    prefix  = "prod"
    credentials = file("terraform-gcp-438010-69b5ce325a5a.json")  
  }
}


resource "google_compute_instance" "my-vm" {
  name         = "my-instance"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"
  
  network_interface {
      network = google_compute_network.vpc_network.id
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      
    }
  }
  
 
}

*/