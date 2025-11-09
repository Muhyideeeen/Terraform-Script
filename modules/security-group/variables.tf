variable "name" { type = string }
variable "vpc_id" { type = string }
variable "ingress" {
  type = list(object({
    from        = number
    to          = number
    protocol    = string
    cidr_blocks = optional(list(string), ["0.0.0.0/0"])
    description = optional(string, "")
  }))
  default = []
}
variable "egress" {
  type = list(object({
    from        = number
    to          = number
    protocol    = string
    cidr_blocks = optional(list(string), ["0.0.0.0/0"])
    description = optional(string, "")
  }))
  default = []
}
variable "tags" { type = map(string), default = {} }
