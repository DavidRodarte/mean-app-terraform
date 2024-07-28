# Creación de la VPC
resource "aws_vpc" "mean_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "mean_vpc"
  }
}

# Creación de subnet con IP pública
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.mean_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Creación de Internet Gateway, será necesario para que la subnet tenga salida a internet
resource "aws_internet_gateway" "igw-principal" {
  tags = {
    Name = "igw-principal"
  }
}

# Creación y configuración del route table 
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.mean_vpc.id
}

resource "aws_route" "internet_route" {
  route_table_id     = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id       = aws_internet_gateway.igw-principal.id  

}

resource "aws_route_table_association" "public_subnet_route_table" {
  subnet_id     = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

# Enlazar nuestro internet gateway con la VPC
resource "aws_internet_gateway_attachment" "igw-enlace" {
  internet_gateway_id = aws_internet_gateway.igw-principal.id
  vpc_id              = aws_vpc.mean_vpc.id
}

# Creación de grupo de seguridad
resource "aws_security_group" "allow_ssh_http" {
  vpc_id = aws_vpc.mean_vpc.id
  name        = "allow_ssh_http"
  description = "Permitir trafico SSH y HTTP"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    description = "Allow all outbound traffic"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_ssh_mongo" {
  vpc_id      =  aws_vpc.mean_vpc.id
  name        = "allow_ssh_mongo"
  description = "Permitir trafico SSH y puerto de MongoDB"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    description = "Allow all outbound traffic"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
