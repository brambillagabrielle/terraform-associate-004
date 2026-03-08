# Displays information about the managed VPC and other Network resources, after created/available
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "vpc_arn" {
  description = "VPC ARN"
  value       = aws_vpc.vpc.arn
}

output "vpc_cidr" {
  description = "VPC CIDR Block"
  value       = aws_vpc.vpc.cidr_block
}

output "public_subnet_id" {
  description = "Public Subnet ID"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "Private Subnet ID"
  value       = aws_subnet.private_subnet.id
}

output "rt_id" {
  description = "Main Route Table ID"
  value       = aws_route_table.main_rt.id
}

output "webserver_sg_id" {
  description = "Webserver Security Group ID"
  value       = aws_security_group.webserver_sg.id
}

output "created_by" {
  description = "User that applied Terraform"
  value       = "${data.aws_caller_identity.current.account_id}/${data.aws_caller_identity.current.arn}"
}

# Sensitive hides the value when displayed in the CLI
output "account_id" {
  description = "Account ID"
  value       = data.aws_caller_identity.current.account_id
  sensitive   = true
}

output "region_name" {
  description = "Current Region name"
  value       = data.aws_region.current.region
}

output "available_azs" {
  description = "Available AZs list"
  value       = data.aws_availability_zones.available.names
}