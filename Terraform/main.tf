
provider "aws" {
  profile    = "aula-terraform"
  region = "us-east-1"
}

module "app" {
  source = "./modules/server"
  ami = var.ami["us-east-1"]
  security_groups_ids = [aws_security_group.allow_http.id]
  user_data = templatefile("scripts/prepara_web.sh.tpl", { db_instance_ip = module.db.ip_privado })
  tags = {
    Name = "aplicacao"
  }
}

module "db" {
  source = "./modules/server"
  ami = var.ami["us-east-1"]
  security_groups_ids = [aws_security_group.allow_postgres.id]
  user_data = file("scripts/prepara_bd.sh")
  tags = {
    Name = "db"
  }
}

module "s3" {
  source = "./modules/s3_bucket"
  bucket_name = "ansible-config-emanuel"
  upload_file = {
    src = "ansible/node-js-getting-started-master.zip",
    dest = "ansible/node-js-getting-started-master.zip"
  }
  tags = {
      Name = "Aula Terraform"
  }
}

output "ip_app" {
     value = "${module.app.ip_publico}"
}