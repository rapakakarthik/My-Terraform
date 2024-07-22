#creating 2 instances 
resource "aws_instance" "dev" {
  ami                         = var.ami
  instance_type               = var.instancetype
  key_name                    = var.key
  subnet_id                   = aws_subnet.dev.id
  security_groups             = [aws_security_group.dev.id]
  associate_public_ip_address = true
  user_data                   = file("test1.sh")
  tags = {
    Name = "cloud-ec2"
  }

}

resource "aws_instance" "test" {
  ami                         = var.ami
  instance_type               = var.instancetype
  key_name                    = var.key
  subnet_id                   = aws_subnet.test.id
  security_groups             = [aws_security_group.test.id]
  associate_public_ip_address = true
  user_data                   = file("test1.sh")
  tags = {
    Name = "cloud222-ec2"
  }

}


resource "aws_instance" "helm" {
  ami                         = var.ami
  instance_type               = var.instancetype
  key_name                    = var.key
  subnet_id                   = aws_subnet.test.id
  vpc_security_group_ids      = [aws_security_group.test.id]
  associate_public_ip_address = true
  user_data                   = file("test1.sh")
  tags = {
    Name = "linux-ec2"
  }

}