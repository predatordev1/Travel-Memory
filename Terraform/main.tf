####### VPC and Network Configuration ############

resource "aws_vpc" "devendra-travel-memory" {
    tags = {
        Name = "Travel-Memory"
        Environment = "dev"
        Owner = "Devendra"
    }
    cidr_block = var.VPC_CIDR
}

resource "aws_subnet" "public-subnet-travel-memory" {
  vpc_id = aws_vpc.devendra-travel-memory.id
  availability_zone = var.availability_zone
  cidr_block = var.public_subnet_cidr
  tags = {
    Name = "public-subnet-travel-memory"
    Owner = "Devendra"
  }
}

resource "aws_subnet" "private-subnet-travel-memory" {
  vpc_id = aws_vpc.devendra-travel-memory.id
  availability_zone = var.availability_zone
  cidr_block = var.private_subnet_cidr
  tags = {
    Name = "private-subnet-travel-memory"
    Owner = "Devendra"
  }
}

resource "aws_internet_gateway" "travel-memory-igw" {
  tags = {
    Name = "Travel-Memory"
    Environment = "dev"
    Owner = "Devendra"
  }
  vpc_id = aws_vpc.devendra-travel-memory.id
}

resource "aws_eip" "travel-memory-eip" {
  domain = "vpc"
  tags = {
    Name = "travel-memory-eip"
    Owner = "Devendra"
  }
}

resource "aws_nat_gateway" "travel-memory-nat" {
  subnet_id = aws_subnet.public-subnet-travel-memory.id
  allocation_id = aws_eip.travel-memory-eip.id
  depends_on = [ aws_internet_gateway.travel-memory-igw ]
  tags = {
    Name = "travel-memory-NAT"
    Owner = "Devendra"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.devendra-travel-memory.id
  tags = {
    Name  = "travel-memory-public-route-table"
    Owner = "Devendra"
  }
}

resource "aws_route" "travel-memory-route-public" {
  route_table_id         = aws_route_table.public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.travel-memory-igw.id
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.devendra-travel-memory.id
  tags = {
    Name  = "travel-memory-private-route-table"
    Owner = "Devendra"
  }
}

resource "aws_route" "travel-memory-route-private" {
  route_table_id         = aws_route_table.private-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.travel-memory-nat.id  
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-subnet-travel-memory.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private-subnet-travel-memory.id
  route_table_id = aws_route_table.private-route-table.id
}

################# EC2 Security Groups ###########

resource "aws_security_group" "travel-memory-frontend-sg" {
  vpc_id = aws_vpc.devendra-travel-memory.id
  tags = {
    Name  = "travel-memory-frontend-sg"
    Owner = "Devendra"
  }
}

# ✅ Separate rules for port 80 and 443
resource "aws_vpc_security_group_ingress_rule" "frontend-http" {
  security_group_id = aws_security_group.travel-memory-frontend-sg.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "frontend-https" {
  security_group_id = aws_security_group.travel-memory-frontend-sg.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "frontend-ssh" {
  security_group_id = aws_security_group.travel-memory-frontend-sg.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "frontend-egress" {
  security_group_id = aws_security_group.travel-memory-frontend-sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_security_group" "travel-memory-backend-sg" {
  vpc_id = aws_vpc.devendra-travel-memory.id
  tags = {
    Name  = "travel-memory-backend-sg"
    Owner = "Devendra"
  }
}

resource "aws_vpc_security_group_ingress_rule" "backend-ssh" {
  security_group_id            = aws_security_group.travel-memory-backend-sg.id
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.travel-memory-frontend-sg.id
  from_port                    = 22
  to_port                      = 22
}

resource "aws_vpc_security_group_egress_rule" "backend-egress" {
  security_group_id = aws_security_group.travel-memory-backend-sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

################# EC2 Instances Launch ###########

resource "aws_key_pair" "key_pair" {
  key_name   = "travel-memory-key"
  public_key = file("~/.ssh/travel-memory.pub")  
}

resource "aws_instance" "frontend-webserver" {
  ami = "ami-05d2d839d4f73aafb"
  instance_type = "t3.small"
  key_name = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.travel-memory-frontend-sg.id]
  subnet_id = aws_subnet.public-subnet-travel-memory.id
  associate_public_ip_address = true
  tags = {
    Name = "travel-memory-frontend"
    Owner = "Devendra"
  }
}

resource "aws_instance" "backend-webserver" {
  ami = "ami-05d2d839d4f73aafb"
  instance_type = "t3.small"
  key_name = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.travel-memory-backend-sg.id]
  subnet_id = aws_subnet.private-subnet-travel-memory.id
  tags = {
    Name = "travel-memory-backend"
    Owner = "Devendra"
  }
}