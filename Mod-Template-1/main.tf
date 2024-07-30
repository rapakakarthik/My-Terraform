resource "aws_instance" "mod" {
  ami           = var.ami
  instance_type = var.instancetype
  key_name      = var.key
  subnet_id     = var.subnet

  tags = {
    Name = var.name
  }

}