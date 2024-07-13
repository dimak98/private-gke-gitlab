variable "region" {
  description = "The region for the GKE cluster"
  type        = string
}

variable "subnetwork_id" {
  description = "The ID of the subnetwork"
  type        = string
}

variable "gke_version" {
  description = "The GKE version to use for the cluster"
  type        = string
}

variable "release_channel" {
  description = "The GKE release channel"
  type        = string
}

variable "master_ipv4_cidr_block" {
  description = "The CIDR block for the GKE master nodes"
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

variable "min_node_count" {
  description = "Minimum number of nodes in the node pool"
  type        = number
}

variable "max_node_count" {
  description = "Maximum number of nodes in the node pool"
  type        = number
}

variable "location_policy" {
  description = "The autoscaling location policy"
  type        = string
}

variable "node_machine_type" {
  description = "Machine type for the nodes"
  type        = string
}

variable "node_preemptible" {
  description = "Whether the nodes are preemptible"
  type        = bool
}

variable "node_tags" {
  description = "Tags for the nodes"
  type        = list(string)
}

variable "node_labels" {
  description = "Labels for the nodes"
  type        = map(string)
}

variable "node_locations" {
  description = "Locations for the nodes"
  type        = list(string)
}
