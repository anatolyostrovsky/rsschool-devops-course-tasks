
#-----------Creating a AWS Role -----------------


resource "aws_iam_role" "GithubActionsRole" {
  name               = "GithubActionsRole"
  assume_role_policy = data.aws_iam_policy_document.oidc.json
}

#-------------Attaching Custom Policy-----------------

data "aws_iam_policy_document" "deploy" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:*",
      "s3:*",
      "route53:*",
      "iam:*",
      "vpc-lattice:*",
      "vpc-lattice-svcs:*",
      "sqs:*",
      "events:*",
      "dynamodb:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "deploy" {
  name        = "ci-deploy-policy"
  description = "Policy used for deployments on CI"
  policy      = data.aws_iam_policy_document.deploy.json
}

resource "aws_iam_role_policy_attachment" "attach-deploy" {
  role       = aws_iam_role.GithubActionsRole.name
  policy_arn = aws_iam_policy.deploy.arn

}


