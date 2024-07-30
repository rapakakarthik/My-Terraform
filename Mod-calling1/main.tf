
provider "aws" {
  region = "us-east-2"

}

module "ec2instance" {
  source       = "../Mod-Template-1"
  ami          = "ami-00db8dadb36c9815e"
  instancetype = "t2.micro"
  key          = "docker"
  subnet       = "subnet-03f0db8201c261c8d"
  name         = "gold"


}