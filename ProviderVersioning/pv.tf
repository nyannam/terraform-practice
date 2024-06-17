terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
       version = "~> 5"
      # version = ">= 4, <=4.9"
      # Instead of deleting lock file ,  use -upgrade flag to modify the lock file
    }
  }
  }
provider "aws"  {
  region = "us-west-2"
}
