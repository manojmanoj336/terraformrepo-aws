resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [var.aud]

  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"] # GitHub currently; keep updated if needed
}

locals {
  sub_patterns = var.github_repo != "" ? ["repo:${var.github_owner}/${var.github_repo}:ref:refs/heads/*", "repo:${var.github_owner}/${var.github_repo}:ref:refs/pull/*"] : ["repo:${var.github_owner}/*:ref:refs/heads/*", "repo:${var.github_owner}/*:ref:refs/pull/*"]
}

resource "aws_iam_role" "github_actions_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = var.aud
          }
          ForAnyValue:StringLike = {
            "token.actions.githubusercontent.com:sub" = local.sub_patterns
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "policy" {
  name = "${aws_iam_role.github_actions_role.name}-policy"
  role = aws_iam_role.github_actions_role.id

  policy = var.policy_json != "" ? var.policy_json : jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:*", "dynamodb:*"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

output "role_arn" {
  value = aws_iam_role.github_actions_role.arn
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.github.arn
}
