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
# defining varibale
variable "environment" {
  default     = "dev"
  type        = string
}

variable "channel_name" {
  default = "codewithpiyush"
}

variable "region" {
  default = "us-east-1"
  
}

# defining locals 
locals {
  bucket_name = "${var.channel_name}-bucket-${var.environment}-${var.region}"
  vpc_name = "${var.environment}-VPC"
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
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



output "vpc_id" {
  value = aws_vpc.sample.id
}



output "bucket_name" {
  value = aws_s3_bucket.first_bucket.bucket
}