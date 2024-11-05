
resource "google_compute_network" "vpc_network" {
  project                 = "terraform-gcp-438010"
  name                    = "vpc-network"
  auto_create_subnetworks = false
  
}


resource "google_compute_subnetwork" "mysubnetwork" {
  name          = "gke-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
 
}
