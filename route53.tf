resource "aws_route53_record" "cloudfront_validation" {
  for_each = local.cloudfront_validations

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.this.zone_id
}

resource "aws_route53_record" "cloudfront" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "${local.cloudfront_dns_name}.${var.route53_zone_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.cf_static.domain_name
    zone_id                = aws_cloudfront_distribution.cf_static.hosted_zone_id
    evaluate_target_health = false
  }
}
