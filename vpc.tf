resource "aws_vpc" "mohsen" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "mohsen-vpc"
  }
}

resource "aws_subnet" "mohsen-pub-1" {
  vpc_id                  = aws_vpc.mohsen.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone1
  tags = {
    Name = "mohsen-pub-1"
  }
}

resource "aws_subnet" "mohsen-pub-2" {
  vpc_id                  = aws_vpc.mohsen.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone2
  tags = {
    Name = "mohsen-pub-2"
  }
}


resource "aws_subnet" "mohsen-pub-3" {
  vpc_id                  = aws_vpc.mohsen.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone3
  tags = {
    Name = "mohsen-pub-3"
  }
}


resource "aws_subnet" "mohsen-priv-1" {
  vpc_id                  = aws_vpc.mohsen.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone1
  tags = {
    Name = "mohsen-priv-1"
  }
}


resource "aws_subnet" "mohsen-priv-2" {
  vpc_id                  = aws_vpc.mohsen.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone2
  tags = {
    Name = "mohsen-priv-2"
  }
}


resource "aws_subnet" "mohsen-priv-3" {
  vpc_id                  = aws_vpc.mohsen.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.zone3
  tags = {
    Name = "mohsen-priv-3"
  }
}

resource "aws_internet_gateway" "mohsen-IGW" {
  vpc_id = aws_vpc.mohsen.id
  tags = {
    Name = "mohsen-IGW"
  }
}

resource "aws_route_table" "mohsen-pub-RT" {
  vpc_id = aws_vpc.mohsen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mohsen-IGW.id
  }

  tags = {
    Name = "mohsen-pub-RT"
  }
}


resource "aws_route_table_association" "mohsen-pub-1-a" {
  subnet_id      = aws_subnet.mohsen-pub-1.id
  route_table_id = aws_route_table.mohsen-pub-RT.id
}

resource "aws_route_table_association" "mohsen-pub-2-a" {
  subnet_id      = aws_subnet.mohsen-pub-2.id
  route_table_id = aws_route_table.mohsen-pub-RT.id
}
resource "aws_route_table_association" "mohsen-pub-3-a" {
  subnet_id      = aws_subnet.mohsen-pub-3.id
  route_table_id = aws_route_table.mohsen-pub-RT.id
}