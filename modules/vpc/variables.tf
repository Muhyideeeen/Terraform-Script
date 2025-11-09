variable "vpc_name" { type = string }
variable "cidr" { type = string, default = "10.0.0.0/16" }
variable "azs" { type = list(string) }
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
variable "enable_nat" { type = bool, default = false }
variable "tags" { type = map(string), default = {} }
