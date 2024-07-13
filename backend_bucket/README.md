# Terraform State Storage Configuration

This Terraform configuration sets up a Google Cloud Storage bucket to store Terraform state files. The bucket is configured with versioning and a lifecycle rule to manage state file versions and automatic deletion of old versions.

## Prerequisites

- Terraform v1.0 or later
- A GCP project with necessary permissions to create storage buckets

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

- `bucket_name`: The name of the GCP storage bucket.
- `region`: The region where the bucket will be created.

