resource "aws_iam_role_policy_attachment" "task_attach" {
  role = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.task.arn
}