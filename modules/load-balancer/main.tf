# LB público de tipo application 
resource "aws_lb" "load_balancer" {
  name               = "lb-app"
  load_balancer_type = "application"
  internal           = false
  subnets            = [var.subnet_id, var.subnet2_id]
  security_groups    = [var.security_group_id]
}

# Definimos nuestro target group con la VPC creada en el módulo security-group 
resource "aws_lb_target_group" "lb_target_group" {
  name     = "tg-app"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Enlazamos el target group con nuestra instancia ec2-app
resource "aws_lb_target_group_attachment" "web_server_attachment" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = var.app_instance_id
  port             = 80
}

# Creamos el listener para direccionar los requests del lb hacia nuestra instancia ec2-app
resource "aws_lb_listener" "lb_listener_app" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}