provider "aws" {
  region     = var.region
  access_key = var.accesskey
  secret_key = var.secretkey
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "ami" {
  type = map(any)
  default = {
    "us-west-2" = "ami-0b20a6f09484773af"
    "us-east-1" = "ami-08a0d1e16fc3f61ea"
    "us-west-1" = "ami-0ca1f30768d0cf0e1"
  }
}

variable "awsregion" {
  default = "us-west-2"
  type    = string
}

resource "aws_instance" "functionsdemo" {
  ami           = lookup(var.ami, var.awsregion)
  instance_type = "t2.micro"

}

output "timestamp" {
  value = local.time
}