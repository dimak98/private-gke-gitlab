output "subnetwork_id" {
  value = google_compute_subnetwork.default_subnetwork.id
}

output "gke_ingress_ip" {
  value = google_compute_address.gke_gitlab_ingress.address
}