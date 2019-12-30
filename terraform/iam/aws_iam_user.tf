resource "aws_iam_user" "deploy-user" {
  name = "deploy-user"
}
resource "aws_iam_user" "s3-user" {
  name = "s3-user"
}