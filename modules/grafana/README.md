# Provisioning the grafana autoscaling group

This module provisions an autoscaling group for Grafana instance along with the S3 bucket and apropriate IAM roles to access the S3 Bucket for pulling ansible code and provisioning the applicaiton on a new instnaces.

## Key Parameters

* `aws_region` AWS region to provision the ALB in. Default `us-east-1`
* `vpc_id` **Required** VPC ID of the vpc to provision the ALB in
* `private_subnet` **Required** List of Private Subnet ID's to provision the the instances in
* `vpc_cidr_block` **Required** CIDR block of the VPC
* `rds_address` **Required** FQDN of the database
* `rds_db_name` **Required** database name
* `rds_db_username` **Required** database username
* `rds_db_password` **Required** database password
* `s3_bucket_name` Name of the bucket used for provisioning. Defaults to `koho-interview-grafana-bucket`
* `instance_public_key` Public key used to provision the instances. Defaults to `~/.ssh/id_rsa.pub`
* `instance_ami` AMI of the server running the application. Defaults to Ubuntu 20.04 (64-bit) on `us-east-1`
* `instance_size` Size of the server running the application. Defaults to `t2.micro`
* `alb_arn` **Required** ARN for the ALB to attach the autoscaling group
* `alb_dns_name` **Required** DNS name of the ALB to set the Base URL for the application.

## Outputs
* `grafana_admin_password` Initial Admin password used to provisioning Grafana
