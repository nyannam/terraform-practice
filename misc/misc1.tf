provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_iam_user" "user" {
  name  = "iamuser.${count.index}"
  count = 3
}

output "arns" {
  value = aws_iam_user.user[*].arn
}