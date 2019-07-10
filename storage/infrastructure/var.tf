variable "db_user" {
  type    = "string"
  default = "admin"
}

variable "db_password" {
  type = "string"
}

variable "rds_subnets" {
  type = list(string)
}
