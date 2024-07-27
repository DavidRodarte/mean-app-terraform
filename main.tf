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

#resource "aws_instance" "ec2-app" {
#  ami           = "ami-0a0e5d9c7acc336f1" # Ubuntu Server 22.04 LTS // us-east-1
#  instance_type = "t2.micro"
#  subnet_id     = "subnet-024aa4fcf235ba614"
#}
