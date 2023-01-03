resource "aws_vpc" dove {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    tags = {
        Name = "vprofile"
    }
}

resource "aws_subnet" "dove-subnet" {
    vpc_id = aws_vpc.dove.id
    cidr_block = "10.0.1.0./4"
    map_public_ip_on_launch = "true"
    availability_zone = var.ZONE
    tags = {
        Name = "dove-subnet"
    }
}