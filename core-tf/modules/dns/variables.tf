variable "gke_ingress_ip" {
  description = "The IP address for the GKE ingress"
  type        = string
}

variable "region" {
  description = "The region for the DNS zone"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}
