#-----------Creating a Role with oidc-----------------
data "aws_caller_identity" "current" {}
data "aws_iam_policy_document" "oidc" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"]
    }

    condition {
      test     = "StringEquals"
      values   = ["sts.amazonaws.com"]
      variable = "token.actions.githubusercontent.com:aud"
    }

    condition {
      test     = "StringLike"
      values   = ["repo:anatolyostrovsky/rsschool-devops-course-tasks:*"]
      variable = "token.actions.githubusercontent.com:sub"
    }
  }
}

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





