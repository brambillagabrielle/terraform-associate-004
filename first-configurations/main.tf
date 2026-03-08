# Imports Data from the environment to be used in the provisioning
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_region" "current" {}

# Returns informations about the current session, such as Account ID
data "aws_caller_identity" "current" {}

# Creates a VPC in the environment, called "terraform-vpc" (Name tag)
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "terraform-vpc"
    Region      = data.aws_region.current.region
    Account     = data.aws_caller_identity.current.account_id
    Environment = var.environment
  }
}

# Creates 2 Subnets placed inside the VPC, one Public and other Private
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name        = "terraform-public-subnet"
    Environment = var.environment
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  # map_public_ip_on_launch = false -> Default

  tags = {
    Name        = "terraform-private-subnet"
    Environment = var.environment
  }
}

# Creates a Route Table and associates it with the 2 Subnets
resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "main-rt"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.main_rt.id
}

resource "aws_route_table_association" "private_rt_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.main_rt.id
}

resource "aws_security_group" "webserver_sg" {
  name        = "webserver-sg"
  description = "Security Group that allows HTTP/HTTPS traffic for a Webserver"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "webserver-sg"
    Environment = var.environment
  }
}