resource "aws_iam_role" "terraform_backend_role" {
  name               = "${local._tag_name}-backend"
  assume_role_policy = data.aws_iam_policy_document.github_oidc_trust_policy.json
}

resource "aws_iam_role_policy_attachment" "terraform_backend_role" {
  role       = aws_iam_role.terraform_backend_role.name
  policy_arn = aws_iam_policy.terraform_backend_policy.arn
}
