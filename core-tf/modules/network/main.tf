resource "google_compute_subnetwork" "default_subnetwork" {
  name          = var.subnetwork_name
  ip_cidr_range = var.subnetwork_cidr
  network       = "default"
  region        = var.region
}

resource "google_compute_address" "gke_gitlab_ingress" {
  name         = "gke-gitlab-ingress"
  subnetwork   = google_compute_subnetwork.default_subnetwork.name
  address_type = "INTERNAL"
}
