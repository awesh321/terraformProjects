terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
  backend "s3" {
    bucket = "awesh-ff1e627560467731"
    key = "website.tfstate"
    region = "ap-south-1"
  }
}

variable "websiteRegion" {
  description = "vlaue of region"
  type = string
  default = "ap-south-1"
}

provider "aws" {
  region = var.websiteRegion
}

resource "aws_s3_bucket" "website-bucket" {
  bucket = "bucket-for-website-awe"
}

resource "aws_s3_bucket_public_access_block" "bucket-public-access" {
  bucket = aws_s3_bucket.website-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.website-bucket.id
  policy = jsonencode(
      {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.website-bucket.bucket}/*"
            ]
        }
    ]
}
  )
}

resource "aws_s3_object" "indexFiles" {
  bucket = aws_s3_bucket.website-bucket.bucket
  key = "index.html"
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "cssFiles" {
  bucket = aws_s3_bucket.website-bucket.bucket
  key = "style.css"
  source = "style.css"
  content_type = "text/css"
}

resource "aws_s3_bucket_website_configuration" "mywebapp" {
  bucket = aws_s3_bucket.website-bucket.id

  index_document {
    suffix = "index.html"
  }
}

output "websitelink" {
  value = aws_s3_bucket_website_configuration.mywebapp.website_endpoint
  
}