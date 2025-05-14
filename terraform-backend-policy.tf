data "aws_iam_policy_document" "terraform_backend_policy" {
  statement {
    sid    = "BackendBucketAccess"
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::s${var.bucket}"
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
      "arn:aws:s3:::s${var.bucket}/*"
    ]
  }
}

resource "aws_iam_policy" "terraform_backend_policy" {
  name        = "${var.deployment.name}-terraform-backend"
  path        = "/"
  description = "This policy is used by terraform in order to access its backend"
  policy      = data.aws_iam_policy_document.data_customer.json
}
