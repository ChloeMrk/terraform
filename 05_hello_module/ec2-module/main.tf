module "vpc-module" {
  source             = "../vpc-module"
}

resource "aws_instance" "hello"{
    ami = var.ami
    instance_type = var.type
    subnet_id = module.vpc-module.subnet
}
