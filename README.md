# Provisioning Grafana

This terraform script provisions grafana on AWS. 


## Prerequisites 
* Provisioning can only be done for Ubuntu, CentOS and Amazon Linux
* Terraform Version should be grater than `>= 0.13.5`

## Key Parameters
* `aws_region` AWS region to deploy the stack to. Defaults to `us-east-1`
* `db_instance_size` Instance size of the DB. Defaults to `db.t2.micro`
* `db_name` Name of the database to be created and used for the application. Defaults to `grafana`
* `db_username` Name of the database user to be created. Defaults to `grafanauser`
* `db_min_storage_size` Minimum storage in GB of the Database block storage. Defaults to `20`
* `db_max_storage_size` Maximum storage size of the Database. Defaults to `100`
* `s3_bucket_name` Name of the bucket used for provisioning. Defaults to `koho-interview-grafana-bucket`
* `instance_public_key` Path to the public key of the server running the application. Defaults to `~/.ssh/id_rsa.pub`
* `instance_ami` AMI of the server running the application. Defaults to Ubuntu 20.04 (64-bit) on `us-east-1`. **If you modify the `aws_region` variable then you will have to look up and paste the correct AMI ID in the tfvars file**
* `instance_size` Size of the server running the application. Defaults to `t2.micro`
* `bastion_ami` AMI of the bastion host. Defaults to Ubuntu 20.04 (64-bit) on `us-east-1`. **If you modify the `aws_region` variable then you will have to look up and paste the correct AMI ID in the tfvars file**
* `bastion_size` Size of the bastion host. Defaults to `t2.micro`
* `bastion_public_key` Path to the public key of the bastion server. Defaults to `~/.ssh/id_rsa.pub`

## Outputs
* `grafana_admin_password` Admin password for grafana
* `grafana_lb_FQDN` Base URL of Grafana
* `bastion_public_ip` Public IP of the bastion host

## Steps to run
1. Create a terraform.tfvars with the variables to modify based on your reqirement. here is an example file to provision for US-WEST-1
```
vim terraform.tfvars
```
```
aws_region = "us-west-1"
instance_ami = "ami-0e4035ae3f70c400f"
bastion_ami = "ami-021809d9177640a20"
```
2. Setup your AWS access key and secret key
```
export AWS_ACCESS_KEY_ID=---REDACTED FOR SECURITY PURPOSE---
export AWS_SECRET_ACCESS_KEY=---REDACTED FOR SECURITY PURPOSE---
```
3. Check the plan
```
terraform plan
```
4. Apply the plan
```
terraform apply
```
