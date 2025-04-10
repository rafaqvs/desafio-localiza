variable "vpc_cidr" {
  type        = string
  description = "CIDR da VPC"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}
