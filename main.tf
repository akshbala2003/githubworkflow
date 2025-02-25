provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = "vpc-${var.env}"
    Environment = var.env
  }
}

resource "aws_subnet" "public_subnet" {
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name        = "public-subnet-${var.env}-${var.availability_zone}"
    Environment = var.env
  }
}

resource "aws_internet_gateway" "test_ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "igw-${var.env}"
    Environment = var.env
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_ig.id
  }
  tags = {
    Name        = "public-rt-${var.env}"
    Environment = var.env
  }
}

resource "aws_route_table_association" "public_rta" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_subnet.id
}
