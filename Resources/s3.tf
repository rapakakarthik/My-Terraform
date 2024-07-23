# #########################################Creating S3 bucket###################################################

# resource "aws_s3_bucket" "main" {
#   bucket = var.mybucket.id
# }

# resource "aws_s3_bucket_versioning" "main" {
#     bucket = var.mybucket.vpc.id
#     versioning_configuration {
#       status = "Enabled"
#     }

# }

