resource "aws_s3_bucket" "ansible_bucket" {
  bucket = "ansible-config-emanuel"
  acl    = "public-read"
  tags = {
      Name = "Aula Terraform"
  }
}