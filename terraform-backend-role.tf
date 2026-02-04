resource "aws_iam_role" "terraform_backend_role" {
  name               = "${local._name_tag}-backend"
  assume_role_policy = data.aws_iam_policy_document.github_oidc_trust_policy.json
}

resource "aws_iam_role_policy" "terraform_backend_policy" {
  name   = "${local._name_tag}-backend"
  policy = data.aws_iam_policy_document.terraform_backend_policy.json
  role   = aws_iam_role.terraform_backend_role.name
}

data "aws_iam_policy_document" "terraform_backend_policy" {
  statement {
    sid    = "BackendBucketAccess"
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${var.backend_bucket}"
    ]
  }
  statement {
    sid    = "BackendObjectAccess"
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = [
      "arn:aws:s3:::${var.backend_bucket}/*"
    ]
  }
}
