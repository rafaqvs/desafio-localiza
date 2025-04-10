variable "private_subnet_ids" {
  type = list(string)
}

variable "sg_id" {
  type = string
}

variable "db_name" {
  type    = string
  default = "appdb"
}

variable "db_user" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type    = string
}
