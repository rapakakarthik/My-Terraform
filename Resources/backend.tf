terraform {
  backend "s3" {
    bucket = "mylostbucky2024"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
