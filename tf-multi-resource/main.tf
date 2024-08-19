terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

locals {
  name = "myproject"
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"

    tags = {
      name = "${local.name}-vpc"
    }
}

resource "aws_subnet" "main" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.${count.index}.0/24"
    count = 2
    availability_zone = "ap-south-1a"

    tags = {
      name = "${local.name}-subnet-${count.index}"
    }
}

# resource "aws_instance" "main" {
#     ami = "ami-0a4408457f9a03be3"
#     instance_type = "t2.micro"
#     count = 4

#     subnet_id = element(aws_subnet.main[*].id, count.index % length(aws_subnet.main))

#     tags = {
#       name = "${local.name}-instance-${count.index}"
#     }
# }

# resource "aws_instance" "main" {
#   count = length(var.ec2_config)
#   ami = var.ec2_config[count.index].ami
#   instance_type = var.ec2_config[count.index].instance_type
#   subnet_id = element(aws_subnet.main[*].id, count.index % length(aws_subnet.main) )
# }


resource "aws_instance" "main" {
  for_each = var.ec2-map
  ami = each.value.ami
  instance_type = each.value.instance_type
  subnet_id = element(aws_subnet.main[*].id, index(keys(var.ec2-map), each.key) % length(aws_subnet.main))

    tags = {
      Name = "${local.name}-instance-${each.key}"
    }
}

output "subnet" {
  value = aws_subnet.main[0].id
}