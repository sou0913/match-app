resource "aws_lb_target_group" "http" {
  name = "match-app-http"
  port = 3000 
  protocol = "HTTP"
  target_type = "ip"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  health_check {
    interval = 30
    path = "/healthcheck"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 10
    healthy_threshold = 3
    unhealthy_threshold = 3
  }
  depends_on = ["aws_lb.lb"]
}
