variable "region" {
  description = "AWS region for this environment"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Name of the environment"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "project1"
}

variable "backend_bucket" {
  description = "S3 bucket to use for Terraform remote state (must exist)"
  type        = string
  default     = "project1-terraform-state" # change to match your infra
}

variable "backend_region" {
  description = "Region where the remote state bucket exists"
  type        = string
  default     = "us-east-1"
}

# variables used by the s3_bucket module
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "force_destroy" {
  description = "Allow bucket deletion when it contains objects"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
