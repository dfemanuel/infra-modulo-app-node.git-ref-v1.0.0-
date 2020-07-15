provider "aws" {
  profile    = "aula-terraform"
  region = "us-east-1"
}

resource "aws_instance" "app" {
  ami = var.ami["us-east-1"]
  instance_type =  var.tipo_instancia
  key_name = "aula-terraform"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  depends_on = [aws_s3_bucket.ansible_bucket]

  tags = {
      Name = "aplicacao"
  }
}

resource "aws_instance" "db" {
  ami = var.ami["us-east-1"]
  instance_type =  var.tipo_instancia
  key_name = "aula-terraform"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
      Name = "db"
  }
}