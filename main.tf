terraform {
  required_version = ">= 0.13.5"
  required_providers {
    aws = {
      version = ">= 3.12.0"
      source  = "hashicorp/aws"
    }
    random = {
      version = ">=3.0.0"
      source  = "hashicorp/random"
    }
  }
}

module "vpc" {
  source     = "./modules/vpc"
  aws_region = var.aws_region
}

module "rds" {
  source              = "./modules/rds"
  aws_region          = var.aws_region
  vpc_id              = module.vpc.vpc_id
  vpc_cidr_block      = module.vpc.vpc_cidr_block
  db_subnet_group     = module.vpc.db_subnet_group
  db_instance_size    = var.db_instance_size
  db_name             = var.db_name
  db_username         = var.db_username
  db_min_storage_size = var.db_min_storage_size
  db_max_storage_size = var.db_max_storage_size
}

module "alb" {
  source         = "./modules/alb"
  aws_region     = var.aws_region
  vpc_id         = module.vpc.vpc_id
  public_subnet  = module.vpc.public_subnet
  vpc_cidr_block = module.vpc.vpc_cidr_block
}

module "bastion" {
  source             = "./modules/bastion"
  aws_region         = var.aws_region
  vpc_id             = module.vpc.vpc_id
  public_subnet      = module.vpc.public_subnet
  vpc_cidr_block     = module.vpc.vpc_cidr_block
  bastion_ami        = var.bastion_ami
  bastion_size       = var.bastion_size
  bastion_public_key = var.bastion_public_key
}

module "grafana" {
  source              = "./modules/grafana"
  aws_region          = var.aws_region
  vpc_id              = module.vpc.vpc_id
  vpc_cidr_block      = module.vpc.vpc_cidr_block
  private_subnet      = module.vpc.private_subnet
  rds_address         = module.rds.rds_address
  rds_db_username     = module.rds.rds_db_username
  rds_db_name         = module.rds.rds_db_name
  rds_db_password     = module.rds.rds_master_password
  alb_arn             = module.alb.alb_arn
  alb_dns_name        = module.alb.alb_dns_name
  s3_bucket_name      = var.s3_bucket_name
  instance_public_key = var.instance_public_key
  instance_ami        = var.instance_ami
  instance_size       = var.instance_size
}
