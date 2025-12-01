output "vpc_id" {
  value = aws_vpc.sample.id
}

output "bucket_name" {
  value = aws_s3_bucket.first_bucket.bucket
}