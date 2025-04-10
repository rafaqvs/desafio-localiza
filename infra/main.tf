provider "aws" {
  region = var.aws_region
}

module "network" {
  source   = "./modules/network"
  vpc_cidr = var.vpc_cidr
  azs      = var.azs
}

module "rds" {
  source         = "./modules/rds"
  vpc_id         = module.network.vpc_id
  db_subnet_ids  = module.network.db_subnet_ids
  db_name        = var.db_name
  db_username    = var.db_username
  db_password    = var.db_password
}
