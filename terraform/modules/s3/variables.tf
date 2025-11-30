variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "When true, disables resource protection and allows bucket to be deleted even if it contains objects"
  type        = bool
  default     = false
}
