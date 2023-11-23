provider "aws" {
    region = "eu-west-3"
    access_key = "*"
    secret_key = "*"
}



module "ec2-module" {
  source            = "./ec2-module"
  
}

