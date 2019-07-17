variable "mysql_username" {
  type    = "string"
  default = "admin"
}

variable "mysql_password" {
  type = "string"
}

variable "rds_subnets" {
  type = list(string)
}
