##############################################Creating EC2-Instance#################################
resource "aws_instance" "main" {
  ami                         = var.os-ami
  instance_type               = var.size-instance-type
  key_name                    = var.key-name
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.main.id]
  associate_public_ip_address = true
  user_data                   = file("main.sh")
  tags = {
    Name = var.name-instance
  }

}