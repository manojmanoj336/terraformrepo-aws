terraform {
  backend "s3" {
    bucket = "project1-terraform-state" # update as appropriate
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "project1-terraform-locks"
    encrypt = true
  }
}
