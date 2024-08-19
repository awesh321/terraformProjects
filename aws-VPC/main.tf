variable "region" {
    description = "value of region"
    type = string
    default = "ap-south-1"
  
}

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

resource "aws_vpc" "awsVPC" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "publicSubnet" {
    vpc_id = aws_vpc.awsVPC.id
    cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "privateSubnet" {
    vpc_id = aws_vpc.awsVPC.id
    cidr_block = "10.0.2.0/24"
}

resource "aws_internet_gateway" "internetGateway" {
    vpc_id = aws_vpc.awsVPC.id
}

resource "aws_route_table" "name" {
  vpc_id = aws_vpc.awsVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetGateway.id
  }
}

resource "aws_route_table_association" "publicSubnetAssociation" {
  subnet_id = aws_subnet.publicSubnet.id
  route_table_id = aws_route_table.name.id
}

resource "aws_instance" "instanceVPC" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.publicSubnet.id
    associate_public_ip_address = true
}