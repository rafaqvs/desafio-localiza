output "vpc_id" {
  value = module.network.vpc_id
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}
