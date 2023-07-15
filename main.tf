provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block
}

resource "aws_security_group" "web" {
  name        = "web"
  description = "Security group for web instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allow_http_cidr]
  }

  egress {
    description = "Outbound internet access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  security_group_ids = [aws_security_group.web.id]
}

resource "aws_lb" "web" {
  name               = "web"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public.id]

  tags = {
    Name = "web-lb"
  }
}

resource "aws_lb_target_group" "web" {
  name     = "web-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path = "/"
  }
}

resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.web.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.web.arn
    type             = "forward"
  }
}

resource "aws_rds_cluster" "db" {
  engine            = var.rds_engine
  engine_mode       = "serverless"
  database_name     = var.rds_database_name
  master_username   = var.rds_master_username
  master_password   = random_password.db_master_password.result
  backup_retention_period = var.rds_backup_retention_period
  deletion_protection = var.rds_deletion_protection

  vpc_security_group_ids = [aws_security_group.db.id]

  scaling_configuration {
    auto_pause               = var.rds_auto_pause
    max_capacity             = var.rds_max_capacity
    min_capacity             = var.rds_min_capacity
    seconds_until_auto_pause = var.rds_seconds_until_auto_pause
  }

  enabled_cloudwatch_logs_exports = [var.rds_cloudwatch_logs_exports]
}

resource "random_password" "db_master_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_security_group" "db" {
  name        = "db"
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "MySQL from web instances"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  egress {
    description = "Outbound internet access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
