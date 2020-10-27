# Provisioning ALB for attaching to Grafana's autoscaling group

This module provisions an internet facing ALB with its own security group in the provided public subnet

## variables

* `aws_region` AWS region to provision the ALB in. Default `us-east-1`
* `vpc_id` **Required** VPC ID of the vpc to provision the ALB in
* `public_subnet` **Required** List of Public Subnet ID's to provision the ALB in
* `vpc_cidr_block` **Required** CIDR block of the VPC

## Outputs
* `alb_arn` ARN for the ALB to provide to the autoscaling group for attachment
* `alb_dns_name` DNS name for the ALB