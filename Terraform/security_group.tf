resource "aws_security_group" "allow_ssh" {
  name        = "sg_aula_ssh"
  description = "Allow ssh inbound traffic"
  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["177.200.95.158/32"]
  }
  tags = {
    Name = "allow_ssh"
  }
}