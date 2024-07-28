terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "security_group" {
  source = "./modules/security-group"
}

module "ec2-app" {
  subnet_id         = module.security_group.subnet_id
  security_group_id = module.security_group.sg_http_id
  source            = "./modules/ec2-app"
}

#module "ec2-mongodb" {
#  source = "./modules/ec2-mongodb"
#}
