provider "aws" {
    region = "us-east-2"   #ohio
}

resource "aws_instance" "foo" {
    ami = "ami-00db8dadb36c9815e"
    instance_type = "t2.micro"
    tags = {
      Name = "micro"
    }
  
}


terraform {
  backend "s3" {
    bucket = "pratice-aws-devops-bucket-2024"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-dynamo-lock"
    encrypt = false
  }
}


