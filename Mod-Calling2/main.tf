provider "aws" {
    region = "us-east-2"
  
}
module "server" {
  source       = "../Mod-Template-1"
  ami          = var.m-ami
  instancetype = var.m-instancetype
  key          = var.m-key
  subnet       = var.m-subnet
  name         = var.m-name


}