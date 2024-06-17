provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_s3_bucket" "s3bucket" {
 # bucket        = "nagabucket"
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.s3bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_account_public_access_block" "public_access" {
  #bucket                  = aws_s3_bucket.Naga-bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
### will upload all the files present under HTML folder to the S3 bucket
resource "aws_s3_object" "upload_obj" {
  for_each     = fileset("html/", "*")
  bucket       = aws_s3_bucket.s3bucket.id
  key          = each.value
  source       = "html/${each.value}"
  etag         = filemd5("html/${each.value}")
  content_type = "text/html"
}