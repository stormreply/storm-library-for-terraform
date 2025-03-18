provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = {
      deployment-actor       = var.deployment.actor
      deployment-code        = "https://github.com/${var.deployment.repository}/tree/${var.deployment.ref_name}"
      deployment-commit      = "https://github.com/${var.deployment.repository}/commit/${var.deployment.sha}"
      deployment-environment = var.deployment.environment
      deployment-name        = var.deployment.name
      deployment-ref         = var.deployment.ref
      deployment-ref-name    = var.deployment.ref_name
      deployment-repository  = "https://github.com/${var.deployment.repository}"
      deployment-sha         = substr(var.deployment.sha, 0, 7)
      deployment-time        = var.deployment.time
    }
  }
}
