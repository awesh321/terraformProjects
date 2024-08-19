terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}

locals {
  users = yamldecode(file("./users.yml")).users
  
}

output "users" {
value = local.users[*].name
}

resource "aws_iam_user" "name" {
  for_each = toset(local.users[*].name)
  name = each.value
}

resource "aws_iam_user_login_profile" "name" {
  for_each = aws_iam_user.name
  user = each.value.name

    lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key,
    ]
  }
}