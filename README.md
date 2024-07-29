# UNIR - Herramientas DevOps: Actividad 3

En esta actividad desplegaremos los siguientes recursos:

- Instancia EC2 con una aplicación Node.js y Nginx
- Instancia EC2 con una base de datos MongoDB
- Load Balancer para dirigir el tráfico hacia nuestra instancia EC2

## Instrucciones

1. Generar SSH Key pair para conectarnos a nuestra instancia
   `ssh-keygen -t rsa -b 2048 -f my-key`
2. Inicializar los módulos de Terraform
   `terraform init`
3. Verificar los cambios
   `terraform plan`
4. Aplicar cambios
   `terraform apply -auto-approve`
