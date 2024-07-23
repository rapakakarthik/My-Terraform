#########################################Creating S3 bucket###################################################

resource "aws_s3_bucket" "main" {
  bucket = var.mybucket
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = var.mybucket
  versioning_configuration {
    status = "Enabled"
  }

}

