variable "cluster_name" {
  type        = string
  description = "Nome do cluster EKS"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Subnets privadas para o EKS"
}
