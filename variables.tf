variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  default     = "10.0.1.0/24"
}

variable "allow_http_cidr" {
  description = "CIDR block allowed to access the web instances over HTTP"
  default     = "0.0.0.0/0"
}

variable "ami" {
  description = "AMI ID for EC2 instances"
  default     = "ami-0123456789abcdef0"
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  default     = "t2.micro"
}

variable "rds_engine" {
  description = "Database engine for RDS instance"
  default     = "mysql"
}

variable "rds_database_name" {
  description = "Database name for RDS instance"
  default     = "mydb"
}

variable "rds_master_username" {
  description = "Master username for RDS instance"
  default     = "admin"
}

variable "rds_backup_retention_period" {
  description = "Number of days to retain backups for RDS instance"
  default     = 7
}

variable "rds_deletion_protection" {
  description = "Enable deletion protection for RDS instance"
  default     = false
}

variable "rds_auto_pause" {
  description = "Enable auto-pause for RDS instance"
  default     = true
}

variable "rds_min_capacity" {
  description = "Minimum capacity units for RDS instance"
  default     = 1
}

variable "rds_max_capacity" {
  description = "Maximum capacity units for RDS instance"
  default     = 4
}

variable "rds_seconds_until_auto_pause" {
  description = "Seconds of inactivity until RDS instance auto-pauses"
  default     = 300
}

variable "rds_cloudwatch_logs_exports" {
  description = "List of CloudWatch logs to export for RDS instance"
  default     = ["audit", "error", "general", "slowquery"]
}
