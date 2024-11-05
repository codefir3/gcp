resource "google_project_service" "IAM-API" {
  project = "terraform-gcp-438010"
  service = "iam.googleapis.com"
  disable_on_destroy = true
 
}

resource "google_project_service" "GKE-API" {
  project = "terraform-gcp-438010"
  service = "container.googleapis.com"
  disable_on_destroy = true

}


resource "google_service_account" "GKE-CUSTER-SA" {
  account_id   = "gke-sa"
  display_name = "Service Account"
  depends_on = [ google_project_service.IAM-API ]
}

resource "google_container_cluster" "primary" {
  name     = "gke-cluster"
  location = "us-central1"
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  network = google_compute_network.vpc_network.self_link
  subnetwork = google_compute_subnetwork.mysubnetwork.self_link
  depends_on = [ google_project_service.GKE-API ]
  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    disk_type = "pd-standard"
    disk_size_gb = "60"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 1
  depends_on = [ google_project_service.GKE-API ]

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    disk_type = "pd-standard"
    disk_size_gb = "60"
     
  
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.GKE-CUSTER-SA.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
