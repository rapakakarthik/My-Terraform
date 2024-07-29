
provider "aws" {

}

resource "aws_s3_bucket" "test" {
  bucket = "testautobucket2998"

}

resource "aws_instance" "test" {
  ami           = "ami-0427090fd1714168b"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.test.id
  vpc_security_group_ids = [ aws_security_group.test.id ]
  depends_on    = [aws_s3_bucket.test]

}