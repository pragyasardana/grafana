variable "aws_region"{
    default = "us-east-1"
    description = "AWS region to deploy the stack to"
}

variable "vpc_id"{
    description = "VPC ID"
}

variable "public_subnet"{
    description = "List of public subnet ID's"
    type = list
}

variable "vpc_cidr_block"{
    description = "VPC Cidr Block"
}