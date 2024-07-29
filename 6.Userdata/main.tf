resource "aws_vpc" "chess" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.ec2name
  }
}

resource "aws_internet_gateway" "chess" {
  vpc_id = aws_vpc.chess.id
  tags = {
    Name = var.ec2name
  }
}

resource "aws_subnet" "chess" {
  vpc_id                  = aws_vpc.chess.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = var.ec2name
  }
}

resource "aws_route_table" "chess" {
  vpc_id = aws_vpc.chess.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.chess.id
  }
  tags = {
    Name = var.ec2name
  }
}

resource "aws_route_table_association" "chess" {
  route_table_id = aws_route_table.chess.id
  subnet_id      = aws_subnet.chess.id
}

resource "aws_security_group" "chess" {
  name   = "This is my sg-group"
  vpc_id = aws_vpc.chess.id
  tags = {
    Name = var.ec2name
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
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