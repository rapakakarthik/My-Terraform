#creating s3 bucket and dynamo DB for state backend storgae and applying the lock mechanisam for statefile


provider "aws" {
}

resource "aws_s3_bucket" "dev-2" {
    bucket = "pratice-aws-devops-bucket-2024"
}


resource "aws_dynamodb_table" "terraform-dynamo-state-lock" {
    name = "terraform-dynamo-lock"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20

    attribute {
      name = "LockID"
      type = "S"
    }
  
}