locals {
  default_tags = {
    Branch      = var.feature_branch
    Product     = var.product
    Owner       = var.owner
    Managed     = "terraform"
    Environment = var.env
  }

  # https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html#AccessLogsBucketAndFileOwnership
  default_resource_name                         = var.feature_branch == "" ? "${var.owner}-${local.service_type_prefix}-${var.env}" : "${var.owner}-${local.service_type_prefix}-${var.env}-${var.feature_branch}"
  cloudfront_dns_name                           = var.feature_branch == "" ? "static.${var.env}" : "static.${var.env}-${var.feature_branch}"
  service_type_prefix                           = "fe"

  cloudfront_validations = length(aws_acm_certificate.cloudfront) > 0 ? {
    for dvo in aws_acm_certificate.cloudfront.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  } : {}

}
