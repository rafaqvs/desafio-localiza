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

module "eks" {
  source             = "./modules/eks"
  cluster_name       = "localiza-eks"
  private_subnet_ids = module.network.private_subnet_ids
}

module "alb_ingress" {
  source              = "./modules/alb_ingress"
  cluster_name        = module.eks.cluster_name
  region              = var.aws_region
  vpc_id              = module.network.vpc_id
  oidc_provider_url   = data.aws_eks_cluster.eks.identity[0].oidc[0].issuer
  oidc_provider_arn   = "arn:aws:iam::<ACCOUNT_ID>:oidc-provider/<OIDC_PROVIDER>" # <- substituir com valores reais
}

