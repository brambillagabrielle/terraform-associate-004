# Creating variables to not hardcode the CIDR Block and Environment name for the VPC
variable "vpc_cidr" {
  description = "CIDR Block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}