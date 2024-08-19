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

data "aws_vpc" "name" {
  tags = {
    awe = "awesh"
  }
}

data "aws_subnet" "name" {
  tags = {
    Name = "private"
  }
}

data "aws_security_group" "name" {
  tags = {
    awe = "awesh"
  }
}

resource "aws_instance" "newinstance" {
  ami = "ami-0a4408457f9a03be3"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.name.id
  associate_public_ip_address = false
  security_groups = [data.aws_security_group.name.id]
}