terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

provider "aws" {
    region = var.region
}

resource "aws_instance" "terraform-practise" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"

    tags = {
      name = "aweshNewTF"
    }

}