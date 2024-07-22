#creating ec2
resource "aws_instance" "test" {
  ami           = var.os-ami
  instance_type = var.size-instance-type

  tags = {
    Name = var.instance-name
  }
}

#creating s3 bucket


resource "aws_s3_bucket" "test" {
  bucket = var.buky


}