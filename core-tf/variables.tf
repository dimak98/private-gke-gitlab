#############################################
##              Enable/Disable Modules     ##
#############################################

variable "enable_gke_standard" {
  description = "Enable or disable the GKE Standard module"
  type        = bool
  default     = true
}

variable "enable_gke_autopilot" {
  description = "Enable or disable the GKE Autopilot module"
  type        = bool
  default     = true
}

#############################################
##              Project Configuration      ##
#############################################

variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The region to deploy resources in"
  type        = string
  default     = "us-central1"
}

#############################################
##            Network Configuration        ##
#############################################

variable "subnetwork_name" {
  description = "The name of the subnetwork"
  type        = string
  default     = "private-subnetwork"
}

variable "subnetwork_cidr" {
  description = "The CIDR range for the subnetwork"
  type        = string
  default     = "10.0.0.0/16"
}

#############################################
##          GKE Cluster Configuration      ##
#############################################

variable "master_ipv4_cidr_block" {
  description = "The CIDR block for the GKE master nodes"
  type        = string
  default     = "172.16.1.0/28"
}

variable "gke_version" {
  description = "The GKE version to use for the cluster"
  type        = string
  default     = "1.28.9-gke.1289002"
}

variable "release_channel" {
  description = "The GKE release channel"
  type        = string
  default     = "UNSPECIFIED"
}

#############################################
##        Node Pool Configuration          ##
#############################################

variable "min_node_count" {
  description = "Minimum number of nodes in the node pool"
  type        = number
  default     = 0
}

variable "max_node_count" {
  description = "Maximum number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "location_policy" {
  description = "The autoscaling location policy"
  type        = string
  default     = "ANY"
}

variable "node_machine_type" {
  description = "Machine type for the nodes"
  type        = string
  default     = "e2-medium"
}

variable "node_preemptible" {
  description = "Whether the nodes are preemptible"
  type        = bool
  default     = false
}

variable "node_tags" {
  description = "Tags for the nodes"
  type        = list(string)
  default     = ["gke-cluster"]
}

variable "node_labels" {
  description = "Labels for the nodes"
  type        = map(string)
  default     = {
    env = "prod"
  }
}

variable "node_locations" {
  description = "Locations for the nodes"
  type        = list(string)
  default     = ["us-central1-a", "us-central1-b", "us-central1-c", "us-central1-f"]
}

#############################################
##         GKE Autopilot Configuration     ##
#############################################

variable "ap_master_ipv4_cidr_block" {
  description = "The CIDR block for the GKE master nodes"
  type        = string
  default     = "172.16.2.0/28"
}

variable "ap_release_channel" {
  description = "The release channel for GKE Autopilot"
  type = string
  default = "STABLE"
}
