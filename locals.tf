data "aws_caller_identity" "current" {}

locals {
  account_id   = data.aws_caller_identity.current.account_id
  actor_suffix = local._metadata.actor != "" ? "-${local._metadata.actor}" : ""
}
