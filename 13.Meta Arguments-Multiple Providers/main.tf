provider "aws" {
  region = "us-east-1"
  alias  = "tokyo"
}

resource "aws_instance" "test" {
  ami                    = "ami-0427090fd1714168b"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.test.id]
  subnet_id              = aws_subnet.test.id
  provider               = aws.tokyo
  tags = {
    Name = "Virginia"
  }
}




########################################################
provider "aws" {
  region = "ap-south-1"
  alias  = "goa"
}

resource "aws_s3_bucket" "main" {
  bucket   = "new200765bucket"
  provider = aws.goa
}







#####################ohio######################################
provider "aws" {
    region = "us-east-2"
    alias = "denmark"
}

resource "aws_instance" "east-2" {
    ami = "ami-00db8dadb36c9815e"
    instance_type = "t2.micro"
    vpc_security_group_ids = [ aws_security_group.ohio.id ]
    subnet_id = aws_subnet.ohio.id
    provider = aws.ohio
    tags = {
      Name = "denmark"
    }
  
}