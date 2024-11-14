# The S3 bucket to store the files
resource "aws_s3_bucket" "file_gateway_bucket" {
  bucket = "nfs-storage-bucket"

  tags = {
    Name = "Dev"
  }
}