resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  force_destroy = var.force_destroy

  tags = merge({
    Name    = var.bucket_name
    Managed = "terraform"
  }, var.tags)

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "clean_old_objects"
    enabled = true
    expiration {
      days = 365
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
