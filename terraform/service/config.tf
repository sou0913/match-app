terraform {
  backend "s3" {
    bucket = "souraform"
    key = "terraform-sample/service/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}