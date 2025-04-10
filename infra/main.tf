provider "aws" {
  region = var.region
}

module "network" {
  source    = "./modules/network"
  vpc_cidr  = "10.0.0.0/16"
  azs       = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "rds" {
  source        = "./modules/rds"
  vpc_id        = module.network.vpc_id
  db_subnet_ids = module.network.db_subnet_ids
  db_username   = "admin"
  db_password   = "SenhaSegura123!"
}
