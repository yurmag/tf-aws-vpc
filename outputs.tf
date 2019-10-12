output "vpc" {
  description = "VPC resource"
  value       = aws_vpc.this
}

output "vpc_igw" {
  description = "The Internet gateway resources associated with the VPC"
  value       = aws_internet_gateway.this
}

output "vpc_vgw" {
  description = "The virtual gateway resources associated with the VPC"
  value       = aws_vpn_gateway.this
}

output "public_subnet_list" {
  description = "The subnet resources"
  value       = aws_subnet.this[*]
}

output "route_table_list" {
  description = "The route table resources"
  value       = aws_route_table.this[*]
}