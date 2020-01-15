resource "aws_security_group" "fargate" {
  name = "fargate"
  description = "fargate sg"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"

    security_groups = [
      aws_security_group.alb.id,
    ]
  }
 
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb" {
  name = "match-app-alb"
  description = "http and https"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "TCP"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db" {
  name = "sample-db"
  description = "DB"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"

    security_groups = [
      aws_security_group.fargate.id
    ]
  }
}
