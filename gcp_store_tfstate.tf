
/*
provider "google" {
  project = "terraform-gcp-438010"
  region  = "us-central1"
  credentials = file("terraform-gcp-438010-69b5ce325a5a.json")
}
resource "google_storage_bucket" "terraform-bucket-for-state" {
  name                        = "learn-bucket123"
  location                    = "us-central1"
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
  
}
terraform {
 

  backend "gcs" {
    bucket  = "learn-bucket123"
    prefix  = "terraform/stat"
    credentials = "terraform-gcp-438010-69b5ce325a5a.json"
  }

}  

data "terraform_remote_state" "terraform-gcp-state" {
  backend = "gcs"
  config = {
    bucket  = "learn-bucket123"
    prefix  = "prod"
    credentials = file("terraform-gcp-438010-69b5ce325a5a.json")  
  }
}

*/