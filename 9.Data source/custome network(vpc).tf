resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.name
  }

}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.name
  }

}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = var.name

  }

}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = var.name

  }

}

resource "aws_route_table_association" "main" {
  route_table_id = aws_route_table.main.id
  subnet_id      = aws_subnet.main.id

}

resource "aws_security_group" "main" {
  vpc_id = aws_vpc.main.id
  name   = "allow"
  tags = {
    Name = var.name
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}