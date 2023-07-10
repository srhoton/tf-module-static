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
