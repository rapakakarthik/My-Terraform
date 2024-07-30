module "git" {
  source       = "github.com/rapakakarthik/Terraform-Modules/mod1" #rapakakarthik github 
  ami          = "ami-00db8dadb36c9815e"
  instancetype = "t2.micro"
  key          = "docker"
  name         = "git-ec2"
}

#########################################################################################
provider "aws" {
  region = "us-east-2"
}

module "github" {
  source       = "github.com/rapakakarthik/My-Terraform/Mod-Template-1" #another repo in git hub
  ami          = "ami-0862be96e41dcbf74"  #ubuntu
  instancetype = "t2.micro"
  key          = "shell"
  name         = "Github-2"

}

