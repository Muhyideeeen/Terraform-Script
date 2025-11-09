resource "aws_vpc" "this" {
  cidr_block = var.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge({ Name = var.vpc_name }, var.tags)
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = merge({ Name = "${var.vpc_name}-igw" }, var.tags)
}

resource "aws_subnet" "public" {
  for_each = { for idx, az in var.azs : idx => { az = az, cidr = var.public_subnet_cidrs[idx] } }
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  map_public_ip_on_launch = true
  tags = merge({ Name = "${var.vpc_name}-public-${each.value.az}" }, var.tags)
}

resource "aws_subnet" "private" {
  for_each = { for idx, az in var.azs : idx => { az = az, cidr = var.private_subnet_cidrs[idx] } }
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = merge({ Name = "${var.vpc_name}-private-${each.value.az}" }, var.tags)
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags = merge({ Name = "${var.vpc_name}-public-rt" }, var.tags)
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public_assoc" {
  for_each = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}
