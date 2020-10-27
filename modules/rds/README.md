# Provisioning the grafana RDS Instance

This module provisions an RDS postgres Database for hosting the Grafana Data along with its Security groups in a provided VPC subnet group. 

## variables

* `aws_region` AWS region to provision the ALB in. Default `us-east-1`
* `vpc_id` **Required** VPC ID of the vpc to provision the ALB in
* `db_subnet_group` **Required** Subnet group for hosting RDS Instance
* `vpc_cidr_block` **Required** CIDR block of the VPC
* `db_instance_size` Size of the RDS Instance. Defaults to `db.t2.micro`
* `db_name` Name of the database to be created. Defaults to `grafana`
* `db_username` Name of the database user to be created. Defaults to `grafanauser`
* `db_min_storage_size` Minimum storage in GB to be given to the RDS instnace. Defaults to `20`
* `db_max_storage_size` Maximum storage in GB to be given to the RDS instnace. Defaults to `100`

## Outputs
* `rds_address` FQDN for the RDS instnace
* `rds_master_password` Master password for the database. 
* `rds_db_name` RDS Database Name
* `rds_db_username` RDS Username