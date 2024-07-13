# Terraform GKE Configuration

This Terraform configuration deploys a Google Kubernetes Engine (GKE) cluster in Google Cloud Platform (GCP) with options for both Standard and Autopilot modes. The configuration also sets up supporting resources like networking and secret management.

## Prerequisites

- Terraform v1.0 or later
- A GCP project with the necessary APIs enabled:
  - GCS Bucket for backend storage
  - Google Kubernetes Engine API
  - Compute Engine API
  - Cloud Resource Manager API
  - Secret Manager API
  - Cloud Storage API

## Usage

1. **Clone the repository:**

    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Initialize Terraform:**

    ```sh
    terraform init
    ```

3. **Review and update the variables:**

    Edit the `variables.tf` file or create a `terraform.tfvars` file to customize the variable values as needed.

4. **Apply the configuration:**

    ```sh
    terraform apply
    ```

## Variables

Below are the key variables used in this configuration. For a complete list, refer to the `variables.tf` file.

- `project_id`: The ID of the GCP project.
- `region`: The region to deploy resources in (default: `us-central1`).
- `subnetwork_name`: The name of the subnetwork (default: `private-subnetwork`).
- `subnetwork_cidr`: The CIDR range for the subnetwork (default: `10.0.0.0/16`).
- `master_ipv4_cidr_block`: The CIDR block for the GKE master nodes (default: `172.16.0.0/28`).
- `gke_version`: The GKE version to use for the cluster (default: `1.28.9-gke.1289002`).
- `release_channel`: The GKE release channel (default: `UNSPECIFIED`).
- `min_node_count`: Minimum number of nodes in the node pool (default: `0`).
- `max_node_count`: Maximum number of nodes in the node pool (default: `3`).
- `location_policy`: The autoscaling location policy (default: `ANY`).
- `node_machine_type`: Machine type for the nodes (default: `n1-standard-1`).
- `node_preemptible`: Whether the nodes are preemptible (default: `false`).
- `node_tags`: Tags for the nodes (default: `["gke-cluster", "additional-tag"]`).
- `node_labels`: Labels for the nodes (default: `{ env = "prod" }`).
- `node_locations`: Locations for the nodes (default: `["us-central1-a", "us-central1-b", "us-central1-c", "us-central1-f"]`).
- `enable_gke_standard`: Enable or disable the GKE Standard module (default: `true`).
- `enable_gke_autopilot`: Enable or disable the GKE Autopilot module (default: `true`).
- `ap_master_ipv4_cidr_block`: The CIDR block for the GKE master nodes in Autopilot mode (default: `172.16.2.0/28`).

## Modules

This configuration uses the following modules:

- `network`: Configures the network and subnetwork.
- `gke_autopilot`: Deploys a GKE cluster in Autopilot mode.
- `gke_standard`: Deploys a GKE cluster in Standard mode.
- `secret_manager`: Manages secrets using Google Secret Manager.
- `service_accounts`: Creates service accounts required by other resources.
- `dns`: Configures DNS settings for the cluster.