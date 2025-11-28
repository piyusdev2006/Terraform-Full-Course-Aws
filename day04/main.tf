terraform {
# s3 backend configuration
    backend "s3" {
    bucket = "codewithpiyush-terraform-bucket-123456-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
# create s3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "codewithpiyush-terraform-bucket-123456"

  tags = {
    Name        = "My bucket 2.0"
    Environment = "Dev"
  }
}


