resource "aws_vpc" "devendra-travel-memory" {
    region = var.region
    tags = {
        Name = "Devendra"
        Environment = "dev"
    }
    cidr_block = var.VPC_CIDR
}

resource "aws_subnet" "public-subnet-travel-memory" {
  region = var.region
  vpc_id = "devendra-travel-memory"
  availability_zone = var.availability_zone
  cidr_block = var.public-subnet-cidr
  tags = {
    Name = "public-subnet-travel-memory"
  }
}

resource "aws_subnet" "private-subnet-travel-memory" {
  region = var.region
  vpc_id = "devendra-travel-memory"
  availability_zone = var.availability_zone
  cidr_block = var.private-subnet-cidr
  tags = {
    Name = "public-subnet-travel-memory"
  }
}