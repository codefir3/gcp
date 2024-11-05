terraform {
  backend "gcs" {
    bucket  = "learn-bueckt1234"
    prefix  = "gke/state"
    credentials = "terraform-gcp-438010-69b5ce325a5a.json"
  }
}

data "terraform_remote_state" "gke-remote-state" {
  backend = "gcs"
  config = {
    bucket  = "learn-bueckt1234"
    prefix  = "gke/state"
    credentials = file("terraform-gcp-438010-69b5ce325a5a.json")
    }
}
