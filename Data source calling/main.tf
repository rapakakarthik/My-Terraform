# provider
provider "aws" {
}

# # Data source --> AMI
# data "aws_ami" "amzlinux" {
#   most_recent = true
#   owners = [ "amazon" ]
#   filter {
#     name = "name"
#     values = [ "amzn2-ami-hvm-*-gp2" ]
#   }
#   filter {
#     name = "root-device-type"
#     values = [ "ebs" ]
#   }
#   filter {
#     name = "virtualization-type"
#     values = [ "hvm" ]
#   }
#   filter {
#     name = "architecture"
#     values = [ "x86_64" ]
#   }
# }

# Data source --> SUBNET
data "aws_subnet" "test" {
  id = var.subnet

}

# Data source --> SECURITY GROUPS
data "aws_security_group" "test" {
  id = var.sg
  

}

# Data source --> Instance 
resource "aws_instance" "test" {
  ami                    = "ami-0427090fd1714168b"
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.test.id
  vpc_security_group_ids = [data.aws_security_group.test.id]

  tags = {
    Name = var.name
  }

}
