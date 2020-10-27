resource "aws_lb" "grafana_alb" {
  name            = "grafana-alb"
  subnets         = var.public_subnet
  security_groups = [aws_security_group.grafana_alb_sg.id]
  internal        = false
  idle_timeout    = 60
}

resource "aws_lb_target_group" "grafana_alb_target_group" {
  name     = "grafana-alb-target-group"
  port     = "3000"
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  stickiness {
    type            = "lb_cookie"
    cookie_duration = 1800
    enabled         = true
  }
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/login"
    port                = 3000
  }
}

resource "aws_lb_listener" "grafana_alb_listener" {
  load_balancer_arn = aws_lb.grafana_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.grafana_alb_target_group.arn
    type             = "forward"
  }
}
