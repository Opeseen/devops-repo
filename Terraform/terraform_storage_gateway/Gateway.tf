# Create and activate the Storage Gateway with the activation key stored in the Variable.tf file
resource "aws_storagegateway_gateway" "file_gateway" {
  gateway_name     = "MyFileGateway"
  gateway_timezone = "GMT"
  gateway_type     = "FILE_S3"
  activation_key   = var.activation_key # Pass the activation key as a variable
  tags = {
    Name = "FileGateway"
  }

  depends_on = [aws_iam_role.storage_gateway_role] # This will only run when the iam storage_gateway_role has been created
}

# Using the tarraform data source to get the diskID
data "aws_storagegateway_local_disk" "disks" {
  disk_path   = "/dev/sdb"
  gateway_arn = aws_storagegateway_gateway.file_gateway.arn
}

# Store the disk id as a variable using terraform locals
locals {
  disk_id = data.aws_storagegateway_local_disk.disks.id
}

# Define local cache storage for the disk attached to the gateway VM
resource "aws_storagegateway_cache" "gateway_cache" {
  gateway_arn = aws_storagegateway_gateway.file_gateway.arn
  disk_id     = local.disk_id
}

# Output the disk_id
output "disk_id" {
  value = local.disk_id
}