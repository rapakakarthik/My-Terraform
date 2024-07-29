#create Instance 


resource "aws_instance" "main" {
  ami = var.my-ami
  instance_type               = var.instance-type
  key_name                    = var.key
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.main.id]
  associate_public_ip_address = true
  user_data                   = file("test.sh")
  tags = {
    Name = "my-ec2"
  }
}