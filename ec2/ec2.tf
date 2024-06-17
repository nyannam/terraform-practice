provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

locals {
  tags = {
    default = var.tags
  }

}

resource "aws_instance" "naga-ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  count         = var.flag == true ? 1 : 0
  tags          = var.tags
}