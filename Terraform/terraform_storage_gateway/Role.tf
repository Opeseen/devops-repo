# The IAM Role Needed For Storage Gateway access
resource "aws_iam_role" "storage_gateway_role" {
  name = "storage-gateway-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "storagegateway.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid" : ""
      }
    ]
  })
}

# Attaching S3 access policy to the IAM role
resource "aws_iam_role_policy" "storage_gateway_policy" {
  name = "storage-gateway-s3-policy"
  role = aws_iam_role.storage_gateway_role.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        "Resource" : [
          aws_s3_bucket.file_gateway_bucket.arn,
          "${aws_s3_bucket.file_gateway_bucket.arn}/*"
        ]
      }
    ]
  })
}