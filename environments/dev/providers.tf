provider "aws" {
  region = var.aws_region
  # Best practice: supply credentials via environment or AWS CLI profile
}
