resource "google_container_cluster" "standard_gke" {
  name               = "gke-standard-private"
  location           = var.region
  network            = "default"
  initial_node_count = 1
  remove_default_node_pool = true
  deletion_protection = false
  subnetwork = var.subnetwork_id
  min_master_version = var.gke_version

  release_channel {
    channel = "UNSPECIFIED"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.subnetwork_cidr
      display_name = var.subnetwork_name
    }
  }
}

resource "google_container_node_pool" "standard_gke_primary_nodes" {
  cluster    = google_container_cluster.standard_gke.name
  location   = google_container_cluster.standard_gke.location
  name       = "primary-node-pool"
  node_count = 1
  node_locations = var.node_locations

  autoscaling {
    total_min_node_count = var.min_node_count
    total_max_node_count = var.max_node_count
    location_policy      = var.location_policy
  }

  node_config {
    preemptible  = var.node_preemptible
    machine_type = var.node_machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    tags = var.node_tags
    labels = var.node_labels
  }

  management {
    auto_upgrade = false
    auto_repair  = false
  }
}
