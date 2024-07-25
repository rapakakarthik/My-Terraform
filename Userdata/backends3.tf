
terraform {
  backend "s3" {
    bucket = "devopsbucketawscloud"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
