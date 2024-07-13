module "network" {
  source            = "./modules/network"
  subnetwork_name   = var.subnetwork_name
  subnetwork_cidr   = var.subnetwork_cidr
  region            = var.region
}

module "gke_autopilot" {
  source                    = "./modules/gke_autopilot"
  count                     = var.enable_gke_autopilot ? 1 : 0
  region                    = var.region
  subnetwork_id             = module.network.subnetwork_id
  ap_master_ipv4_cidr_block = var.ap_master_ipv4_cidr_block
  ap_release_channel        = var.ap_release_channel
  subnetwork_cidr           = var.subnetwork_cidr
  subnetwork_name           = var.subnetwork_name
}

module "gke_standard" {
  source                   = "./modules/gke_standard"
  count                    = var.enable_gke_standard ? 1 : 0
  region                   = var.region
  subnetwork_id            = module.network.subnetwork_id
  gke_version              = var.gke_version
  release_channel          = var.release_channel
  master_ipv4_cidr_block   = var.master_ipv4_cidr_block
  subnetwork_cidr          = var.subnetwork_cidr
  subnetwork_name          = var.subnetwork_name
  min_node_count           = var.min_node_count
  max_node_count           = var.max_node_count
  location_policy          = var.location_policy
  node_machine_type        = var.node_machine_type
  node_preemptible         = var.node_preemptible
  node_tags                = var.node_tags
  node_labels              = var.node_labels
  node_locations           = var.node_locations
}

module "secret_manager" {
  source    = "./modules/secret_manager"
  project_id = var.project_id
}

module "service_accounts" {
  source    = "./modules/service_accounts"
  project_id = var.project_id
}

module "dns" {
  source    = "./modules/dns"
  region    = var.region
  project_id = var.project_id
  gke_ingress_ip = module.network.gke_ingress_ip
}

