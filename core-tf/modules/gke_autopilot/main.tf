resource "google_container_cluster" "gke_autopilot" {
  enable_autopilot = true
  name             = "gke-autopilot-private"
  location         = var.region
  network          = "default"
  subnetwork       = var.subnetwork_id

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.ap_master_ipv4_cidr_block
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.subnetwork_cidr
      display_name = var.subnetwork_name
    }
  }

  maintenance_policy {
    recurring_window {
      start_time = "2024-07-13T00:00:00Z"
      end_time   = "2050-01-01T04:00:00Z"
      recurrence = "FREQ=WEEKLY"
    }
  }

  release_channel {
    channel = var.ap_release_channel
  }
}
