module "s3_bucket" {
  source = "../../modules/s3"

  bucket_name   = var.bucket_name
  region        = var.region
  force_destroy = var.force_destroy
  tags          = var.tags
}
