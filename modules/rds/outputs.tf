output "rds_address"{
    value = aws_db_instance.grafana_db.address
}

output "rds_master_password"{
    value = random_password.grafana_db_master_password.result
}

output "rds_db_name"{
    value = var.db_name
}

output "rds_db_username"{
    value = var.db_username
}