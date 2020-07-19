resource "aws_s3_bucket" "ansible_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  tags = var.tags
}
resource "aws_s3_bucket_object" "upload" {
  bucket = aws_s3_bucket.ansible_bucket.bucket
  key    = var.upload_file["dest"]
  source = var.upload_file["src"]
  acl = "public-read"
  tags = var.tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "gw_id"

  tags = {
    Name = "main_gateway"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = "public_subnet_id"
  cidr_block = "10.0.1.0/16"

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = "private_subnet_id"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "private_subnet"
  }
}