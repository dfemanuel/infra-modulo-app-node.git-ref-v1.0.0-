variable "tipo_instancia" {
    type = string
    default = "t2.micro"
}

variable "ami" {
    type = map
    default = {
        "us-east-1" = "ami-0ac80df6eff0e70b5"
    }
}