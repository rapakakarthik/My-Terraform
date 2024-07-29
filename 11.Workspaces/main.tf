provider "aws" {
}

resource "aws_s3_bucket" "tom" {
    bucket = "aws-bucketwithdevops2"
}