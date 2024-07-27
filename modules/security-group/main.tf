# VPC
resource "aws_vpc" "mean_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "mean_vpc"
  }
}

# Creación de subnet con IP pública
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.mean_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Creación de grupo de seguridad
resource "aws_security_group" "mean-group" {

}
