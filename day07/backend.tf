terraform {
  backend "s3" {
    bucket = "codewithpiyush-terraform-bucket-123456-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}