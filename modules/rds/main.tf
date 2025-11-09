resource "aws_db_subnet_group" "this" {
  name       = "${var.identifier}-db-subnet-group"
  subnet_ids = var.subnet_ids
  tags = merge({ Name = "${var.identifier}-db-subnet-group" }, var.tags)
}

resource "aws_db_instance" "this" {
  identifier              = var.identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  username                = var.username
  password                = var.password
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = var.security_group_ids
  skip_final_snapshot     = var.skip_final_snapshot
  publicly_accessible     = false
  tags = merge({ Name = var.identifier }, var.tags)
}
