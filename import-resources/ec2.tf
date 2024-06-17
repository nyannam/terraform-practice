provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

#this ec2 instance already created manually, to create a config file from already created resource use terraform import command
# Run terraform import aws_instance.ec2 {instance id}. get instance id from aws console.
resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet
  vpc_security_group_ids = var.vpcid
  tags                   = var.tags
}