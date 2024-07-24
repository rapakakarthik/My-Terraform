terraform {
  backend "s3" {
    bucket = "devopscloudec2"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

#First created s3 bucket and after pushed this terraform.tfstate into backend.tf like above script
resource "aws_s3_bucket" "test" {
    bucket = var.bucket
}

resource "aws_s3_bucket_versioning" "test" {
    bucket = var.bucket
    versioning_configuration {
      status = "Enabled"
    }
    
  
}