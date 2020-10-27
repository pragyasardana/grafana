output "grafana_admin_password" {
  value = module.grafana.grafana_admin_password
}

output "grafana_lb_FQDN" {
  value = module.alb.alb_dns_name
}

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}
