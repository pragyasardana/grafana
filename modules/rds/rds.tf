resource "random_password" "grafana_db_master_password" {
  length  = 16
  special = false
}

resource "aws_db_instance" "grafana_db" {
  allocated_storage      = var.db_min_storage_size
  max_allocated_storage  = var.db_max_storage_size
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "11"
  instance_class         = var.db_instance_size
  name                   = var.db_name
  username               = var.db_username
  password               = random_password.grafana_db_master_password.result
  db_subnet_group_name   = var.db_subnet_group
  vpc_security_group_ids = [aws_security_group.grafana_db_sg.id]
  skip_final_snapshot    = true
}
