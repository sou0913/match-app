resource "aws_iam_policy" "deploy" {
  name = "deploy"
  path = "/"
  description = "deploy policy"
  policy = file("aws_iam_policies/ecr_policy.json")
}

resource "aws_iam_policy" "s3" {
  name = "s3_policy"
  path = "/"
  description = "upload images to s3"
  policy = file("aws_iam_policies/s3_policy.json")
}
