variable "region" {
  description = "The region for the GKE cluster"
  type        = string
}

variable "subnetwork_id" {
  description = "The ID of the subnetwork"
  type        = string
}

variable "ap_master_ipv4_cidr_block" {
  description = "The master CIDR block for GKE Autopilot"
  type        = string
}

variable "subnetwork_cidr" {
  description = "The CIDR block for the subnetwork"
  type        = string
}

variable "subnetwork_name" {
  description = "The name of the subnetwork"
  type        = string
}

variable "ap_release_channel" {
  description = "The release channel for GKE Autopilot"
  type = string
}