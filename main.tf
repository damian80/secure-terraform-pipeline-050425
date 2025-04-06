provider "aws" {
  region = "us-east-1" # or your preferred region
}

resource "aws_s3_bucket" "secure_bucket" {
  bucket = "damians3-060425"  # Must be globally unique
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.secure_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}
