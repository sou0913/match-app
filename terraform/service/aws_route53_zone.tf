data "aws_route53_zone" "isshoni" {
  name = "isshoni.link"
}

resource "aws_route53_record" "isshoni" {
  zone_id = data.aws_route53_zone.isshoni.zone_id
  name = data.aws_route53_zone.isshoni.name
  type = "A"

  alias {
    name = aws_lb.lb.dns_name
    zone_id = aws_lb.lb.zone_id
    evaluate_target_health = true
  }
}