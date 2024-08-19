resource "aws_s3_bucket" "demo-bucket" {
    bucket = "awesh-${random_id.rand_id.hex}"
}

resource "aws_s3_object" "bucket-data" {
    bucket = aws_s3_bucket.demo-bucket.bucket 
    source = "myfile.txt"
    key = "mydata.txt"
}

resource "random_id" "rand_id" {
    byte_length = 8
}