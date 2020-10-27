# Provisioning the VPC, Public and Private Subnets, RDS Subnet Group, and Internet access for each subnets.

This module provisions the VPC with public and private subnet's in all its availability zones for hosting the components of the application.

## Key Parameters
* `aws_region` **Required** AWS region to provision the ALB in. Default `us-east-1`


## Outputs
* `vpc_id` ID of the VPC created
* `vpc_cidr_block` CIDR of the VPC created
* `db_subnet_group` Subnet group for hosting an RDS instance
* `public_subnet` List of ID's of the public subnets created
* `private_subnet` List of ID's of the public subnets created
