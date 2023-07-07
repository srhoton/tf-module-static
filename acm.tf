resource "aws_acm_certificate" "cloudfront" {
  domain_name       = "${local.cloudfront_dns_name}.${var.route53_zone_name}"
  validation_method = "DNS"
}
