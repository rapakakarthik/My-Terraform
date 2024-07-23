#creating ec2
resource "aws_instance" "test" {
  ami           = var.os-ami
  instance_type = var.size-instance-type

  tags = {
    Name = "lilly-ec2"
  }
}
