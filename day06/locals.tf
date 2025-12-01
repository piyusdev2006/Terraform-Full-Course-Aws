locals {
  bucket_name = "${var.channel_name}-bucket-${var.environment}-${var.region}"
  vpc_name = "${var.environment}-VPC"
}