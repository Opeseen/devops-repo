terraform {
  backend "s3" {
    bucket = "terraform-bucket02"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}