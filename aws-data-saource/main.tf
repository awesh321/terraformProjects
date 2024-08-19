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

data "aws_ami" "name" {
    most_recent = true
    owners = ["amazon"]
}

output "aws_ami" {
  value =  data.aws_ami.name.id
}

#security group

data "aws_security_group" "name" {
    tags = {
      awe = "awesh"
    }
}

output "aws_security_group_id" {
  value = data.aws_security_group.name.id
}

data "aws_availability_zones" "names" {
  state = "available"
    
}

output "aws_availability_zone_id" {
  value = data.aws_availability_zones.names
}

# to get the caller identity
data "aws_caller_identity" "name" {
}

output "aws_caller_identity" {
  value = data.aws_caller_identity.name
}

data "aws_region" "name" {
}

output "aws_region" {
  value = data.aws_region.name  
}
