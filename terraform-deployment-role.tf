resource "aws_iam_role" "terraform_deployment_role" {
  name               = "${var.deployment.name}-terraform-deployment"
  assume_role_policy = data.aws_iam_policy_document.github_oidc_trust_policy.json
}

resource "aws_iam_role_policy_attachment" "terraform_deployment_role" {
  role       = aws_iam_role.terraform_deployment_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
