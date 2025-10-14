data "aws_caller_identity" "current" {}

resource "aws_kms_key" "main" {
  description             = "A symmetric encryption KMS key for Portal Listing components"
  enable_key_rotation     = false
  deletion_window_in_days = 20
  tags = {
    Name        = "portal-listing-key"
  }
}

resource "aws_kms_alias" "example_alias" {
    name          = "alias/portal-listing-key"
    target_key_id = aws_kms_key.main.key_id
}

resource "aws_kms_key_policy" "main" {
  key_id = aws_kms_key.main.id
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "key-consolepolicy-3"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        Action   = "kms:*"
        Resource = "*"
      }
    ]
  })
}