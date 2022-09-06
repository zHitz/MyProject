resource "aws_vpc" "myproject" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myproject"
  }
}
resource "aws_subnet" "myproject-pub-1" {
  vpc_id                  = aws_vpc.myproject.id
  cidr_block              = "192.168.1.0/24"
  availability_zone       = var.ZONE1
  map_public_ip_on_launch = true
  tags = {
    Name = "myproject-pub-1"
  }
}
resource "aws_subnet" "myproject-pub-2" {
  vpc_id                  = aws_vpc.myproject.id
  cidr_block              = "192.168.2.0/24"
  availability_zone       = var.ZONE2
  map_public_ip_on_launch = true
  tags = {
    Name = "myproject-pub-2"
  }
}
resource "aws_subnet" "myproject-pub-3" {
  vpc_id                  = aws_vpc.myproject.id
  cidr_block              = "192.168.3.0/24"
  availability_zone       = var.ZONE3
  map_public_ip_on_launch = true
  tags = {
    Name = "myproject-pub-3"
  }
}
resource "aws_subnet" "myproject-priv-1" {
  vpc_id                  = aws_vpc.myproject.id
  cidr_block              = "192.168.11.0/24"
  availability_zone       = var.ZONE1
  map_public_ip_on_launch = true
  tags = {
    Name = "myproject-priv-1"
  }
}
resource "aws_subnet" "myproject-priv-2" {
  vpc_id                  = aws_vpc.myproject.id
  cidr_block              = "192.168.12.0/24"
  availability_zone       = var.ZONE2
  map_public_ip_on_launch = true
  tags = {
    Name = "myproject-priv-2"
  }
}
resource "aws_subnet" "myproject-priv-3" {
  vpc_id                  = aws_vpc.myproject.id
  cidr_block              = "192.168.13.0/24"
  availability_zone       = var.ZONE3
  map_public_ip_on_launch = true
  tags = {
    Name = "myproject-priv-3"
  }
}
resource "aws_internet_gateway" "myproject-gw" {
  vpc_id = aws_vpc.myproject.id

  tags = {
    Name = "myproject-gw"
  }
}
resource "aws_route_table" "myproject-rt" {
  vpc_id = aws_vpc.myproject.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myproject-gw.id
  }
  tags = {
    Name = "myproject-gw"
  }
}
resource "aws_route_table_association" "myproject-pub-1-a" {
  subnet_id      = aws_subnet.myproject-pub-1.id
  route_table_id = aws_route_table.myproject-rt.id
}
resource "aws_route_table_association" "myproject-pub-2-a" {
  subnet_id      = aws_subnet.myproject-pub-2.id
  route_table_id = aws_route_table.myproject-rt.id
}
resource "aws_route_table_association" "myproject-pub-3-a" {
  subnet_id      = aws_subnet.myproject-pub-3.id
  route_table_id = aws_route_table.myproject-rt.id
}