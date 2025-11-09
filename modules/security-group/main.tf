resource "aws_security_group" "this" {
  name   = var.name
  vpc_id = var.vpc_id
  description = "${var.name} security group"
  tags = merge({ Name = var.name }, var.tags)
}

resource "aws_security_group_rule" "ingress" {
  for_each = { for idx, r in var.ingress : idx => r }
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.protocol
  cidr_blocks       = lookup(each.value, "cidr_blocks", ["0.0.0.0/0"])
  description       = lookup(each.value, "description", null)
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "egress" {
  for_each = { for idx, r in var.egress : idx => r }
  type              = "egress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.protocol
  cidr_blocks       = lookup(each.value, "cidr_blocks", ["0.0.0.0/0"])
  description       = lookup(each.value, "description", null)
  security_group_id = aws_security_group.this.id
}
