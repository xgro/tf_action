# S3 bucket for backend
resource "aws_s3_bucket" "for_tfstate" {
  bucket = "xgro-test-tfstate"
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.for_tfstate.bucket

  versioning_configuration {
    status = "Enabled"
  }
}



# DynamoDB for terraform state lock
resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "terraform-lock"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}


