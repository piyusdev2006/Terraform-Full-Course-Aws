# create s3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = local.bucket_name

  tags = {
    Name        = local.bucket_name
    Environment = var.environment
  }
}


resource "aws_vpc" "sample" {
  cidr_block = "10.0.0.0/24"
  region = var.region
  tags = {
    Name = local.vpc_name
    Environment = var.environment
  }
}