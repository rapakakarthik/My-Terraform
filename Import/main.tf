resource "aws_instance" "git" {
    ami = "ami-0427090fd1714168b"
    instance_type = "t2.micro"

    tags = {
      Name = "rama"
    }

  
}