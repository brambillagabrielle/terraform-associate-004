# Creates a VPC in the environment, called "terraform-vpc" (Name tag)
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "terraform-vpc"
    Environment = "demo"
  }
}