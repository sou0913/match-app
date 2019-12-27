resource "aws_acm_certificate" "isshoni" {
  domain_name = data.aws_route53_zone.isshoni.name
  subject_alternative_names = []
  validation_method = "DNS"
}