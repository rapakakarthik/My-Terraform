###########################################################################
# VPC
###########################################################################

resource "aws_vpc" "shell" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.name
  }

}

############################################################################
# Subnet
############################################################################

resource "aws_subnet" "shell" {
  vpc_id                  = aws_vpc.shell.id
  availability_zone       = "us-east-2a"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = var.name
  }
}

################################################################################
# Internet Gateway
################################################################################

resource "aws_internet_gateway" "shell" {
  vpc_id = aws_vpc.shell.id
  tags = {
    Name = var.name
  }
}


#################################################################################
# Route Table
#################################################################################

resource "aws_route_table" "shell" {
  vpc_id = aws_vpc.shell.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.shell.id
  }
  tags = {
    Name = var.name
  }
}

resource "aws_route_table_association" "shell" {
  subnet_id      = aws_subnet.shell.id
  route_table_id = aws_route_table.shell.id
}

##################################################################################
# Security Group
##################################################################################

resource "aws_security_group" "shell" {
  vpc_id = aws_vpc.shell.id
  name   = "my-sg-groups"
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