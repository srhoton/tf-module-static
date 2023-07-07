
#variable "cloudfront_logs_enabled" {
#  type        = bool
#  default     = false
#  description = "Controls whether logs are enabled on the CloudFront distribution.  If enabled, module also creates the bucket where logs are delivered"
#}

#variable "cloudfront_logs_enable_cookies" {
#  type        = bool
#  default     = false
#  description = "Controls whether cookies are included in CloudFront logs.  Only available if 'cloudfront_logs_enabled' is true"
#}

#variable "cloudfront_subdomain" {
#  type        = string
#  default     = "app"
#  description = "Subdomain for the CloudFront distribution.  e.g. '<subdomain>.<domain>.com'"
#}

#variable "wildcard_cloudfront_subdomains" {
#  type        = bool
#  default     = false
#  description = "Controls whether to wildcard subdomains for the CloudFront distribution.  e.g. '*.<subdomain>.<domain>.com' if enabled, or '<subdomain>.<domain>.com' if disabled"
#}

variable "env" {
  type        = string
  description = "Describes which environment this belongs to.  Typically one of [dev, tst, stg, prd]"
}

variable "feature_branch" {
  description = "Name of feature branch which is being deployed.  Required for dev environments."
  type        = string
  default     = ""
}

variable "route53_zone_name" {
  type        = string
  description = "Route53 Zone name e.g. dealerware.com"
}

variable "product" {
  type        = string
  description = "AWS Tag: Describes which product is associated with these resources"
}

variable "owner" {
  type        = string
  description = "AWS Tag: Describes business-unit level Owner of these resources.  Also used as a naming prefix"
}
