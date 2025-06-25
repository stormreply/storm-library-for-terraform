resource "aws_iam_role" "terraform_deployment_role" {
  name               = "${var.deployment.name}-deployment"
  assume_role_policy = data.aws_iam_policy_document.github_oidc_trust_policy.json
}

# TODO:
resource "aws_iam_role_policy_attachment" "terraform_deployment_role" {
  # checkov:skip=CKV_AWS_274: "AWS AdministratorAccess policy is used by IAM roles, users, or groups"
  role       = aws_iam_role.terraform_deployment_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
