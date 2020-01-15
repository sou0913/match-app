resource "aws_iam_role" "ecs_task_role" {
  name = "ecs_task_role"
  path = "/"
  assume_role_policy = file("aws_iam_role_policies/ecs_task_assume_role_policy.json")
}
