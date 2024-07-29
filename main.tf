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

module "ec2-mongodb" {
  subnet_id         = module.security_group.subnet_id
  security_group_id = module.security_group.sg_mongo_id
  source            = "./modules/ec2-mongodb"
}

module "ec2-app" {
  subnet_id         = module.security_group.subnet_id
  security_group_id = module.security_group.sg_http_id
  source            = "./modules/ec2-app"
}

module "load-balancer" {
  vpc_id            = module.security_group.vpc_id
  subnet_id         = module.security_group.subnet_id
  subnet2_id        = module.security_group.subnet2_id
  security_group_id = module.security_group.sg_http_id
  app_instance_id   = module.ec2-app.instance_id
  source            = "./modules/load-balancer"
}
