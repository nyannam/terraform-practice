provider "aws" {
  region     = var.region
  access_key = var.accesskey
  secret_key = var.secretkey
}

/*
The below code will work, but there’s unnecessary repetition – for each ingress and egress rule, there is a duplicate block of text. Any additional rules make this duplication hard to read and reproduce.
*/
/*resource "aws_security_group" "sg-group" {
  name        = "webserver"
  description = "Security Group for Web Servers"
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = [var.vpc-cidr]
  }
  egress {
    protocol    = "tcp"
    from_port   = 1433
    to_port     = 1433
    cidr_blocks = [var.vpc-cidr]
  }
}*/

locals {
  inbound_ports  = [80, 443]
  outbound_ports = [443, 1433]
}

resource "aws_security_group" "sg_group" {
  name        = "webserver"
  description = "Security Group for Web Servers"

  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      cidr_blocks = [var.vpc-cidr]
      protocol    = "tcp"
    }
  }

}