output "alb_arn" {
  value = aws_lb_target_group.grafana_alb_target_group.arn
}

output "alb_dns_name" {
  value = aws_lb.grafana_alb.dns_name
}
