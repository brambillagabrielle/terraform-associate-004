# Creating variables to not hardcode the CIDR Block and Environment name for the VPC
variable "vpc_cidr" {
  description = "CIDR Block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Environment name for tagging"
  type        = string
  default     = "terraform-course"
}

# Creating variables for the Subnets that will be placed inside the VPC
variable "public_subnet_cidr" {
  description = "CIDR Block for the Public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR Block for the Private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "AZ to place de Subnets"
  type        = string
  default     = "us-east-1a"
}