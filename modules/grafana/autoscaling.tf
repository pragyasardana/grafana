resource "random_password" "grafana_admin_password"{
    length = 16
    special = false
}

resource "random_password" "grafana_secret_key"{
    length = 16
    special = false
}

resource "aws_key_pair" "grafana_instance_ssh_key" {
  key_name   = "grafana_instance_ssh_key"
  public_key = file(var.instance_public_key)
}

resource "aws_launch_configuration" "grafana_launch_config" {
  image_id        = var.instance_ami
  instance_type   = var.instance_size
  security_groups = [aws_security_group.grafana_instance_sg.id]
  key_name = aws_key_pair.grafana_instance_ssh_key.key_name
  iam_instance_profile = aws_iam_instance_profile.grafana_bucket_access_profile.name
  user_data = templatefile("${path.module}/install_grafana.sh.tmpl", {
      bucket_name = aws_s3_bucket.grafana_bucket.id,
      rds_address = var.rds_address,
      grafana_db_password = var.rds_db_password,
      grafana_admin_password = random_password.grafana_admin_password.result,
      grafana_secret_key = random_password.grafana_secret_key.result,
      grafana_db_username = var.rds_db_username,
      grafana_db_name = var.rds_db_name,
      grafana_domanin = var.alb_dns_name
  })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "grafana" {
  launch_configuration = aws_launch_configuration.grafana_launch_config.name
  vpc_zone_identifier  = var.private_subnet
  health_check_type    = "ELB"

  min_size = 2
  max_size = 10
}

resource "aws_autoscaling_attachment" "grafana_alb_autoscale" {
  alb_target_group_arn   = var.alb_arn
  autoscaling_group_name = aws_autoscaling_group.grafana.id
}
