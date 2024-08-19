terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

locals {
  name = "Awesh"
  abx = "mithu"
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "terraform-practise" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = var.aws_instance_types

    root_block_device {
      delete_on_termination = true
      volume_size = var.aws_volume.v_size
      volume_type = var.aws_volume.volume_type
    }

    tags = merge(var.additional_tags, {
      name = local.name
    })

}