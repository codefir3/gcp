/*
terraform {
 
  backend "gcs" {
    bucket  = "learn-bucket123"
    prefix  = "terraform/state"
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