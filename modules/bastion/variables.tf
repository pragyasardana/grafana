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

variable "public_subnet"{
    description = "List of public subnet ID's"
    type = list
}

variable "bastion_ami"{
    default = "ami-0dba2cb6798deb6d8"
    description = "AMI of the bastion host"
}

variable "bastion_size"{
    default = "t2.micro"
    description = "Size of the bastion ami"
}

variable "bastion_public_key"{
    default = "~/.ssh/id_rsa.pub"
    description = "Path to the public key of the bastion server"
}