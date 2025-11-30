output "bucket_id" {
  description = "The bucket name/id"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}
