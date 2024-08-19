output "s3BucketObjectList" {
  value = aws_s3_object.bucket-data.bucket
}

output "random_id_use" {
  value = random_id.rand_id.hex
}