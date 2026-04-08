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