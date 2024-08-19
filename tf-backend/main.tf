terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
  backend "s3" {
    bucket = "awesh-ff1e627560467731"
    key = "backend.tfstate"
    region = "ap-south-1"
    
  }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "demo-instanses" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"

    tags = {
      name = "s3-state"
    }
}