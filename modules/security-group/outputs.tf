output "sg_http_id" {
  value = aws_security_group.allow_ssh_http.id
}

output "sg_mongo_id" {
  value = aws_security_group.allow_ssh_mongo.id
}

output "subnet_id" {
  value = aws_subnet.subnet_1.id
}
