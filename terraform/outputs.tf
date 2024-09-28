output "iam_role_arn" {
  value = aws_iam_role.GithubActionsRole.arn
}


output "s3_bucket_arn" {
  value = aws_s3_bucket.rs_task_bucket9194.arn
}



