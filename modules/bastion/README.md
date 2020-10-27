# Provisioning Bastion instance for SSH access to the private instances

This module provisions a bastion instance on the Public subnet provided with all the appropriate security groups for accessing the private host

## variables

* `aws_region` AWS region to provision the ALB in. Default `us-east-1`
* `vpc_id` **Required** VPC ID of the vpc to provision the ALB in
* `public_subnet` **Required** List of Public Subnet ID's to provision the Bastion instance in
* `vpc_cidr_block` **Required** CIDR block of the VPC
* `bastion_ami` AMI for the bastion instance. Defaults to Ubuntu 20.04 (64-bit) on `us-east-1`
* `bastion_size` Size of the bastion instnace. Defaults to `t2.micro`
* `bastion_public_key` Path to the public key of the bastion server. Defaults to `~/.ssh/id_rsa.pub`

## Outputs
* `bastion_public_ip` Public IP of the bastion instance