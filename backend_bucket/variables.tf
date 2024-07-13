variable "bucket_name" {
  description = "The name of the GCS bucket to store Terraform state"
  type        = string
  default = "<unique-bucket-name>"
}

variable "region" {
  description = "The region for the GCS bucket"
  type        = string
  default     = "US"
}
