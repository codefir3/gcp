
/*
resource "google_storage_bucket" "terraform_remote_state" {
  name          = "learn-bueckt1234"
  location      = "US"
  force_destroy = true
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
  public_access_prevention = "enforced"
}

*/