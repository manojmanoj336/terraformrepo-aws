bucket_name   = "project1-s3-bucket-dev"
region        = "us-east-1"
environment   = "dev"
project       = "project1"
force_destroy = true
tags = {
  Environment = "dev"
  ManagedBy   = "terraform"
  Project     = "project1"
}
