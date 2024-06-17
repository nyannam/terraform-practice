provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "my-ec2" {
  ami           = ""
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "test_bucket" {

}

output "ec2-output" {
  value = aws_instance.my-ec2.id
}

output "s3-output" {
  value = aws_s3_bucket.test_bucket.bucket
}