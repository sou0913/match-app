resource "aws_iam_user_policy_attachment" "deploy-attach" {
  user = aws_iam_user.deploy-user.name
  policy_arn = aws_iam_policy.deploy.arn
}
resource "aws_iam_user_policy_attachment" "s3-attach" {
  user = aws_iam_user.s3-user.name
  policy_arn = aws_iam_policy.s3.arn
}