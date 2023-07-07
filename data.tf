data "aws_region" "current" {}

data "aws_route53_zone" "this" {
  name         = var.route53_zone_name
  private_zone = false
}

data "aws_iam_policy_document" "read_static_bucket" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.static_origin_bucket.arn}/*"]

		principals {
			type        = "Service"
			identifiers = ["cloudfront.amazonaws.com"]
		}
		condition {
			test     = "StringEquals"
			variable = "AWS:SourceArn"
			values   = [aws_cloudfront_distribution.cf_static.arn]
		}
  }
}
