provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "shell" {
  ami                    = var.ami
  instance_type          = var.instancetype
  key_name               = var.key
  subnet_id              = aws_subnet.shell.id
  vpc_security_group_ids = [aws_security_group.shell.id]

  tags = {
    Name = var.name
  }
}