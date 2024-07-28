resource "aws_instance" "ec2-app" {
  ami             = "ami-0a0e5d9c7acc336f1" # Ubuntu Server 22.04 LTS // us-east-1
  instance_type   = "t2.micro"
  subnet_id       = var.subnet_id
  security_groups = [ var.security_group_id ]
  associate_public_ip_address = true
  tags = {
    Name = "node-nginx-server"
  }
}
