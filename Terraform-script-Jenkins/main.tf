provider "aws" {
  region = "us-east-2"   #ohio
}


resource "aws_instance" "git" {
    ami = "ami-00db8dadb36c9815e"
    instance_type = "t2.micro"
    key_name = "docker"


    tags = {
        Name = "fix-ec2"
    }
  
}