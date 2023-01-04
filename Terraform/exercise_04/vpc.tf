resource "aws_vpc" "dove" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "vprofile"
  }
}

resource "aws_subnet" "dove-pub-subnet-01" {
  vpc_id                  = aws_vpc.dove.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "dove-pub-subnet-01"
  }
}

resource "aws_subnet" "dove-pub-subnet-02" {
  vpc_id                  = aws_vpc.dove.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "dove-pub-subnet-02"
  }
}

resource "aws_subnet" "dove-pub-subnet-03" {
  vpc_id                  = aws_vpc.dove.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "dove-pub-subnet-03"
  }
}

resource "aws_subnet" "dove-priv-subnet-01" {
  vpc_id                  = aws_vpc.dove.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "dove-priv-subnet-01"
  }
}

resource "aws_subnet" "dove-priv-subnet-02" {
  vpc_id                  = aws_vpc.dove.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "dove-priv-subnet-02"
  }
}

resource "aws_subnet" "dove-priv-subnet-03" {
  vpc_id                  = aws_vpc.dove.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "dove-priv-subnet-03"
  }
}

resource "aws_internet_gateway" "dove-IGW" {
  vpc_id = aws_vpc.dove.id
  tags = {
    Name = "dove-IGW"
  }
}

resource "aws_route_table" "dove-pub-RT" {
  vpc_id = aws_vpc.dove.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dove-IGW.id
  }
  tags = {
    "Name" = "dove-pub-RT"
  }
}

resource "aws_route_table_association" "dove-pub1-a" {
  subnet_id      = aws_subnet.dove-pub-subnet-01.id
  route_table_id = aws_route_table.dove-pub-RT.id
}

resource "aws_route_table_association" "dove-pub1-b" {
  subnet_id      = aws_subnet.dove-pub-subnet-02.id
  route_table_id = aws_route_table.dove-pub-RT.id
}

resource "aws_route_table_association" "dove-pub1-c" {
  subnet_id      = aws_subnet.dove-pub-subnet-03.id
  route_table_id = aws_route_table.dove-pub-RT.id
}