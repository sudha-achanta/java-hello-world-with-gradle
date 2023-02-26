provider "aws" {
  # Configuration options
  region     = "us-west-2"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

resource "aws_s3_bucket" "java-deploy" {
  bucket = "tf-java-bucket"

  tags = {
    Name        = "java-tf"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "my-s3-acl" {
  bucket = aws_s3_bucket.java-deploy.id
  acl    = "public"
}
