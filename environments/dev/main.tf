variable "environment" {
  type    = string
  default = "dev"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_name = "myapp-${var.environment}"
  cidr     = "10.10.0.0/16"
  azs      = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnet_cidrs  = ["10.10.1.0/24","10.10.2.0/24"]
  private_subnet_cidrs = ["10.10.11.0/24","10.10.12.0/24"]
  tags = { environment = var.environment }
}

module "web_sg" {
  source = "../../modules/security-group"
  name = "myapp-web-sg-${var.environment}"
  vpc_id = module.vpc.vpc_id
  ingress = [
    { from = 80, to = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from = 443, to = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
  ]
  egress = [
    { from = 0, to = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
  ]
  tags = { environment = var.environment }
}

module "compute" {
  source = "../../modules/compute"
  name = "myapp-web-${var.environment}"
  ami_filters = { name = "amzn2-ami-hvm-*-x86_64-gp2", owner_id = "137112412989" }
  instance_type = "t3.micro"
  private_subnet_ids = module.vpc.private_subnet_ids
  security_group_ids  = [module.web_sg.security_group_id]
  asg_desired = 1
  tags = { environment = var.environment }
}

module "alb" {
  source = "../../modules/elb"
  name = "myapp-${var.environment}"
  subnet_ids = module.vpc.public_subnet_ids
  security_group_ids = [module.web_sg.security_group_id]
  tags = { environment = var.environment }
}
