variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR da VPC"
}

variable "azs" {
  type        = list(string)
  description = "Zonas de disponibilidade"
}
