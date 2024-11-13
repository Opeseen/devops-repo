resource "aws_vpc" "dove_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "opeseen_vpc"
  }

}

resource "aws_subnet" "dove-pub-1" {
  vpc_id                  = aws_vpc.dove_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE1
  tags = {
    Name = "opeseen-pub-1"
  }
}

resource "aws_subnet" "dove-pub-2" {
  vpc_id                  = aws_vpc.dove_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE2
  tags = {
    Name = "opeseen-pub-2"
  }
}

resource "aws_subnet" "dove-pub-3" {
  vpc_id                  = aws_vpc.dove_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE3
  tags = {
    Name = "opeseen-pub-3"
  }
}

resource "aws_subnet" "dove-priv-1" {
  vpc_id                  = aws_vpc.dove_vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE1
  tags = {
    Name = "opeseen-priv-1"
  }
}

resource "aws_subnet" "dove-priv-2" {
  vpc_id                  = aws_vpc.dove_vpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE2
  tags = {
    Name = "opeseen-priv-2"
  }
}

resource "aws_subnet" "dove-priv-3" {
  vpc_id                  = aws_vpc.dove_vpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE3
  tags = {
    Name = "opeseen-priv-3"
  }
}

resource "aws_internet_gateway" "dove-igw" {
  vpc_id = aws_vpc.dove_vpc.id
  tags = {
    Name = "opeseen-igw"
  }
}

resource "aws_route_table" "dove-pub-RT" {
  vpc_id = aws_vpc.dove_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dove-igw.id
  }
  tags = {
    Name = "opeseen-pub-RT"
  }
}

resource "aws_route_table_association" "doce-pub-1a" {
  subnet_id      = aws_subnet.dove-pub-1.id
  route_table_id = aws_route_table.dove-pub-RT.id
}

resource "aws_route_table_association" "doce-pub-2a" {
  subnet_id      = aws_subnet.dove-pub-2.id
  route_table_id = aws_route_table.dove-pub-RT.id
}

resource "aws_route_table_association" "doce-pub-3a" {
  subnet_id      = aws_subnet.dove-pub-3.id
  route_table_id = aws_route_table.dove-pub-RT.id
}