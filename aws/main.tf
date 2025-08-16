
resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name
  tags = {
    Project = "multi-cloud-static-site"
  }
}

# Allow static website hosting
resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
}

# Public access block must allow public ACL/policy for static website
resource "aws_s3_bucket_public_access_block" "site" {
  bucket                  = aws_s3_bucket.site.id
  block_public_acls       = false
  block_public_policy     = false
  restrict_public_buckets = false
  ignore_public_acls      = false
}

# Bucket policy for public read access to website content
data "aws_iam_policy_document" "public_read" {
  statement {
    sid     = "PublicReadGetObject"
    actions = ["s3:GetObject"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["${aws_s3_bucket.site.arn}/*"]
  }
}

resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site.id
  policy = data.aws_iam_policy_document.public_read.json
}

# Upload index.html
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.site.id
  key          = "index.html"
  source       = var.index_html
  content_type = "text/html"
  etag         = filemd5(var.index_html)
}

output "website_url" {
  value = "http://${aws_s3_bucket_website_configuration.site.website_endpoint}"
}
