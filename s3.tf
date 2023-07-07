resource "aws_s3_bucket" "static_origin_bucket" {
  bucket = "static-${local.default_resource_name}.${var.route53_zone_name}"
  tags = local.default_tags
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.static_origin_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_policy" "read_static_origin_bucket" {
  bucket = aws_s3_bucket.static_origin_bucket.id
  policy = data.aws_iam_policy_document.read_static_bucket.json
}

resource "aws_s3_object" "images" {
  for_each = fileset("${path.module}/images", "*")
  bucket = aws_s3_bucket.static_origin_bucket.id
  key    = "static/${each.value}"
  source = "images/${each.value}"

  etag = filemd5("images/${each.value}")
}
