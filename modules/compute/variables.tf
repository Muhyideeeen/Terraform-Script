variable "name" { type = string }
variable "ami_filters" { type = map(string) } # expects { name = "...", owner_id = "..." }
variable "instance_type" { type = string, default = "t3.micro" }
variable "private_subnet_ids" { type = list(string) }
variable "security_group_ids" { type = list(string) }
variable "asg_desired" { type = number, default = 1 }
variable "user_data" { type = string, default = "" }
variable "tags" { type = map(string), default = {} }
