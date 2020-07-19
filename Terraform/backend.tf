resource "aws_s3_bucket" "backend_bucket" {
  bucket = "terraform-edf-backend"
  versioning {
    enabled = true
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-edf-backend"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}