provider "aws" {
  region = "us-west-2"
  access_key = ""
  secret_key = ""
}

resource "aws_db_instance" "naga-rds" {
  allocated_storage    = 10
  db_name              = "testdb"
  engine               = "postgres"
  engine_version       = "16"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  skip_final_snapshot  = true

}

resource "aws_default_subnet" "naga-subnet" {

  availability_zone = "us-west-2a"

}

resource "aws_default_vpc" "naga-vpc" {
  tags = {
    Name = "naga-vpc"
  }
}