data "terraform_remote_state" "aws_iam" {
  backend = "s3"

  config = {
    bucket = "souraform"
    key = "terraform-sample/iam/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "souraform"
    key = "terraform-sample/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}