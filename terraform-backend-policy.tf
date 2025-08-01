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

resource "aws_iam_policy" "terraform_backend_policy" {
  name        = "${var.deployment.name}-backend"
  path        = "/"
  description = "This policy is used by terraform in order to access its backend"
  policy      = data.aws_iam_policy_document.terraform_backend_policy.json
}
