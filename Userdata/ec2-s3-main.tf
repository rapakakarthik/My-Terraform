provider "aws" {
}

resource "aws_instance" "chess" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key
  subnet_id                   = aws_subnet.chess.id
  vpc_security_group_ids      = [aws_security_group.chess.id]
  associate_public_ip_address = true
  user_data                   = file("user.sh")

}




