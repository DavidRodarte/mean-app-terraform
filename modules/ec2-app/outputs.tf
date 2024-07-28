output "instance_id" {
  value = aws_instance.ec2-app.id
}

output "instance_public_ip" {
  description = "IP publica de la instancia ec2-app"
  value       = aws_instance.ec2-app.public_ip
}

output "instance_private_ip" {
  description = "IP privada de la instancia ec2-app"
  value       = aws_instance.ec2-app.private_ip
}