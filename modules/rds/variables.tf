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

variable "db_subnet_group" {
    description = "Subnet group for RDS Instance"
}

variable "db_instance_size"{
    default = "db.t2.micro"
    description = "Instance size of the DB"
}

variable "db_name"{
    default = "grafana"
    description = "Name of the database to be created"
}

variable "db_username"{
    default = "grafanauser"
    description = "Name of the database user to be created"
}

variable "db_min_storage_size"{
    default = 20
    description = "Minimum storage size of the Database"
}

variable "db_max_storage_size"{
    default = 100
    description = "Maximum storage size of the Database"
}
