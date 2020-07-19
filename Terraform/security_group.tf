resource "aws_security_group" "allow_http" {
  name        = "sg_web_ingress"
  description = "Permite trafego de entrada HTTP"
  ingress {
    description = "Entrada HTTP de qualquer lugar"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_http"
  }
}

resource "aws_security_group" "allow_postgres" {
  name        = "sg_postgres"
  description = "Permite que as maquinas do sg_web_ingress conectem no Postgres"
  ingress {
    description = "Acesso Postgres a partir do sg_web_ingress"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.allow_http.id]
  }
  tags = {
    Name = "allow_postgres"
  }
}