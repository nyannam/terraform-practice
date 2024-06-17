provider "aws" {
  region = "us-west-2"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "ec2" {
  ami           = ""
  instance_type = "t2.micro"
}

