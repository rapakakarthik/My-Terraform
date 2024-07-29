resource "aws_vpc" "dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "cloud-vpc"
  }
}


resource "aws_vpc" "test" {
  cidr_block = "20.0.0.0/16"
  tags = {
    Name = "test-vpc"
  }

}








resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name = "cloud-igw"
  }
}

resource "aws_internet_gateway" "test" {
  vpc_id = aws_vpc.test.id
  tags = {
    Name = "test-igw"
  }

}







resource "aws_subnet" "dev" {
  availability_zone       = "us-east-1a"
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "cloud-subnet"
  }
}

resource "aws_subnet" "test" {
  vpc_id                  = aws_vpc.test.id
  availability_zone       = "us-east-1b"
  cidr_block              = "20.0.0.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "test-subnet"
  }
}






resource "aws_route_table" "dev" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
  }
  tags = {
    Name = "cloud-rt"
  }

}




resource "aws_route_table_association" "dev" {
  route_table_id = aws_route_table.dev.id
  subnet_id      = aws_subnet.dev.id
}


resource "aws_route_table" "test" {
  vpc_id = aws_vpc.test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test.id
  }
  tags = {
    Name = "test-rt"
  }

}

resource "aws_route_table_association" "test" {
  route_table_id = aws_route_table.test.id
  subnet_id      = aws_subnet.test.id

}






resource "aws_security_group" "dev" {
  vpc_id = aws_vpc.dev.id
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
  tags = {
    Name = "cloud-sg"
  }
}





resource "aws_security_group" "test" {
  vpc_id = aws_vpc.test.id
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
  tags = {
    Name = "cloud--sgsg"
  }
}