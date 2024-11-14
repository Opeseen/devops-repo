# Configure an NFS File Share linked to the S3 bucket
resource "aws_storagegateway_nfs_file_share" "nfs_file_share" {
  gateway_arn           = aws_storagegateway_gateway.file_gateway.arn
  location_arn          = aws_s3_bucket.file_gateway_bucket.arn
  role_arn              = aws_iam_role.storage_gateway_role.arn
  default_storage_class = "S3_STANDARD"
  object_acl            = "private"

  client_list             = ["0.0.0.0/0"]
  squash                  = "RootSquash"
  guess_mime_type_enabled = true

  tags = {
    Name = "NFSFileShare"
  }
}