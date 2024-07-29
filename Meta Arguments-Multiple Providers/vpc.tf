resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"


}

resource "aws_internet_gateway" "test" {
  vpc_id = aws_vpc.test.id

}

resource "aws_subnet" "test" {
  vpc_id                  = aws_vpc.test.id
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "test" {
  vpc_id = aws_vpc.test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test.id
  }


}

resource "aws_route_table_association" "test" {
  subnet_id      = aws_subnet.test.id
  route_table_id = aws_route_table.test.id

}

resource "aws_security_group" "test" {
  vpc_id = aws_vpc.test.id
  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



#########ohio network##############


provider "aws" {
  region = "us-east-2"
  alias  = "ohio"

}
resource "aws_vpc" "ohio" {
  cidr_block = "12.0.0.0/16"
  provider   = aws.ohio


}

resource "aws_internet_gateway" "ohio" {
  vpc_id   = aws_vpc.ohio.id
  provider = aws.ohio

}

resource "aws_subnet" "ohio" {
  vpc_id                  = aws_vpc.ohio.id
  cidr_block              = "12.0.0.0/24"
  map_public_ip_on_launch = true
  provider                = aws.ohio
}

resource "aws_route_table" "ohio" {
  vpc_id = aws_vpc.ohio.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ohio.id

  }
  provider = aws.ohio


}

resource "aws_route_table_association" "ohio" {
  subnet_id      = aws_subnet.ohio.id
  route_table_id = aws_route_table.ohio.id
  provider       = aws.ohio

}

resource "aws_security_group" "ohio" {
  provider = aws.ohio
  vpc_id   = aws_vpc.ohio.id
  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}