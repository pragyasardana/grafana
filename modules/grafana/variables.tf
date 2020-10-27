variable "aws_region"{
    default = "us-east-1"
    description = "AWS region to deploy the stack to"
}

variable "vpc_id"{
    description = "VPC ID"
}

variable "vpc_cidr_block"{
    description = "VPC Cidr Block"
}

variable "private_subnet"{
    description = "List of private subnet ID's"
    type = list
}

variable "rds_address"{
    description = "FQDN of the database"
}

variable "rds_db_name"{
    description = "database name"
}

variable "rds_db_username"{
    description = "database username"
}

variable "rds_db_password"{
    description = "database password"
}

variable "s3_bucket_name"{
    default = "koho-interview-grafana-bucket"
    description = "Name of the bucket used for provisioning"
}

variable "instance_public_key"{
    default = "~/.ssh/id_rsa.pub"
    description = "Path to the public key of the server running the application"
}

variable "instance_ami"{
    default = "ami-0dba2cb6798deb6d8"
    description = "AMI of the server running the application"
}

variable "instance_size"{
    default = "t2.micro"
    description = "Size of the server running the application"
}

variable "alb_arn"{
    description = "ARN for the appropriate ALB"
}

variable "alb_dns_name"{
    description = "DNS name of the ALB" 
}