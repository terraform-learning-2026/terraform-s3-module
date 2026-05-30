resource "aws_s3_bucket" "digi-bucket" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "digi-s3-blocks" {
  bucket                  = aws_s3_bucket.digi-bucket.id
  block_public_acls       = var.block_public_access
  block_public_policy     = var.block_public_access
  ignore_public_acls      = var.block_public_access
  restrict_public_buckets = var.block_public_access
}

resource "aws_s3_bucket_versioning" "digi-s3-version" {
  bucket = aws_s3_bucket.digi-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

data "aws_iam_policy_document" "digi-s3-policy-statement" {
  statement {
    principals {
      identifiers = ["arn:aws:iam::${var.account}:root"]
      type        = "AWS"
    }
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.digi-bucket.arn
    ]
  }
}