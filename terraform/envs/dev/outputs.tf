output "bucket_id" {
  description = "The S3 bucket ID"
  value       = module.s3_bucket.bucket_id
}

output "bucket_arn" {
  description = "The S3 bucket ARN"
  value       = module.s3_bucket.bucket_arn
}
