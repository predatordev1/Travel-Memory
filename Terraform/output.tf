output "vpc-id" {
  description = "VPC is Created with name."
  value = aws_vpc.devendra-travel-memory.id
}

output "vpc-arn" {
  description = "ARN of created VPC."
  value = aws_vpc.devendra-travel-memory.arn
}


output "public-subnet-arn" {
  description = "ARN of created public-subnet-arn."
  value = aws_subnet.public-subnet-travel-memory.arn
}

output "private-subnet-arn" {
  description = "ARN of created private-subnet-arn."
  value = aws_subnet.private-subnet-travel-memory.arn
}

output "IGW_ARN" {
  description = "ARN of Created IGW."
  value = aws_internet_gateway.travel-memory-igw.arn
}

output "NAT_ARN" {
  description = "ARN of created NAT gateway."
  value = aws_nat_gateway.travel-memory-nat.id
}

output "route-table-public" {
  description = "Route table of travel-memory"
  value = aws_route.travel-memory-route-public.id
}

output "route-table-private" {
  description = "Route table of travel-memory"
  value = aws_route.travel-memory-route-private.id
}

output "backend_security_groups" {
  description = "created frontend security groups"
  value = aws_security_group.travel-memory-backend-sg.id
}

output "frontend_security_groups" {
  description = "created backend security groups"
  value = aws_security_group.travel-memory-frontend-sg.id
}

output "frontend-instance-id" {
  description = "frontend-travel-memory-instance-public-ip."
  value = aws_instance.frontend-webserver.public_ip
}

output "backend-instance-id" {
  description = "backend-travel-memory-instance-private_ip."
  value = aws_instance.backend-webserver.private_ip
}