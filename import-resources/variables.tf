variable "region" {
  type = string
}

variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet" {
  type = string
}

variable "vpcid" {
  type = list(any)
}

variable "tags" {
  type = map(any)
}