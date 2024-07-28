output "app_public_ip" {
  value       = module.ec2-app.instance_public_ip
  description = "IP publica de instancia EC2 con servidor Node y Nginx"
}

output "app_private_ip" {
  value       = module.ec2-app.instance_private_ip
  description = "IP privada de instancia EC2 con servidor Node y Nginx"
}

output "mongodb_public_ip" {
  value       = module.ec2-mongodb.instance_public_ip
  description = "IP publica de instancia EC2 con base de datos MongoDB"
}

output "mongodb_private_ip" {
  value       = module.ec2-mongodb.instance_private_ip
  description = "IP privada de instancia EC2 con base de datos MongoDB"
}

output "load_balancer_dns" {
  value       = module.load-balancer.lb_dns
  description = "DNS de Load Balancer"
}