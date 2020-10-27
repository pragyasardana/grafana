variable "aws_region" {
  default     = "us-east-1"
  description = "AWS region to deploy the stack to"
}

variable "db_instance_size" {
  default     = "db.t2.micro"
  description = "Instance size of the DB"
}

variable "db_name" {
  default     = "grafana"
  description = "Name of the database to be created"
}

variable "db_username" {
  default     = "grafanauser"
  description = "Name of the database user to be created"
}

variable "db_min_storage_size" {
  default     = 20
  description = "Minimum storage size of the Database"
}

variable "db_max_storage_size" {
  default     = 100
  description = "Maximum storage size of the Database"
}

variable "s3_bucket_name" {
  default     = "koho-interview-grafana-bucket"
  description = "Name of the bucket used for provisioning"
}

variable "instance_public_key" {
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to the public key of the server running the application"
}

variable "instance_ami" {
  default     = "ami-0dba2cb6798deb6d8"
  description = "AMI of the server running the application"
}

variable "instance_size" {
  default     = "t2.micro"
  description = "Size of the server running the application"
}

variable "bastion_ami" {
  default     = "ami-0dba2cb6798deb6d8"
  description = "AMI of the bastion host"
}

variable "bastion_size" {
  default     = "t2.micro"
  description = "Size of the bastion host"
}

variable "bastion_public_key" {
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to the public key of the bastion server"
}
