variable "server_port" {
  type    = number
  default = 8080
}

variable "security_group_name" {
  type    = string
  default = "aws01-terraform-example-instance"
}
