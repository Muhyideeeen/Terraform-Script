variable "identifier" { type = string }
variable "engine" { type = string, default = "postgres" }
variable "engine_version" { type = string, default = "15.3" }
variable "instance_class" { type = string, default = "db.t3.micro" }
variable "allocated_storage" { type = number, default = 20 }
variable "username" { type = string }
variable "password" { type = string, sensitive = true }
variable "subnet_ids" { type = list(string) }
variable "security_group_ids" { type = list(string) }
variable "skip_final_snapshot" { type = bool, default = true }
variable "tags" { type = map(string), default = {} }
