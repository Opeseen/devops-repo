# Specifying the cloud provider
provider "aws" {
  region = "us-east-1"
}

# S3 bucket to store the files
resource "aws_s3_bucket" "file_gateway_bucket" {
  bucket = "stoage-gw-007"

  tags = {
    Name= "Dev"
  }
}

# IAM Role Needed For Storage Gateway access
resource "aws_iam_role" "storage_gateway_role" {
  name = "storage-gateway-role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "storagegateway.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  })
}

# Attaching S3 access policy to the IAM role
resource "aws_iam_role_policy" "storage_gateway_policy" {
  name = "storage-gateway-s3-policy"
  role = aws_iam_role.storage_gateway_role.id

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        "Resource": [
          aws_s3_bucket.file_gateway_bucket.arn,
          "${aws_s3_bucket.file_gateway_bucket.arn}/*"
        ]
      }
    ]
  })
}

# Activate the Storage Gateway with the activation key obtained from VMware deployment
resource "aws_storagegateway_gateway" "file_gateway" {
  gateway_name       = "MyFileGateway"
  gateway_timezone   = "GMT"
  gateway_type       = "FILE_S3"
  activation_key     = var.activation_key  # Pass the activation key as a variable
  tags = {
    Name = "FileGateway"
  }

  depends_on = [aws_iam_role.storage_gateway_role]
}


# Define local cache storage (e.g., a disk attached to the gateway VM)
# resource "aws_storagegateway_cache" "gateway_cache" {
#   gateway_arn = aws_storagegateway_gateway.file_gateway.arn
#   disk_id     = "16ae1ec4-b1a4-4f50-96f6-b8dd7e7c4dca" # Replace with your disk's identifier
# }

variable "activation_key" {
	default = "9D4EQ-FVNHO-QDQN0-KL55O-6SIDP"
  description = "The activation key obtained when deploying the gateway VM in VMware"
  type        = string
}
# variable "gateway_arn" {
#   type    = string
#   default = "arn:aws:storagegateway:us-east-1:017820658776:gateway/sgw-1D76F374"
# }
data "aws_storagegateway_local_disk" "disks" {
  disk_path   = "/dev/sdb"
  gateway_arn = aws_storagegateway_gateway.file_gateway.arn
}

output "disk_id" {
  value = data.aws_storagegateway_local_disk.disks
}