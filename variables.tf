variable "backend_bucket" {
  description = "Central backend bucket of the Storm Library for Terraform (SLT)™"
  type        = string
}

variable "github_principal" {
  description = "Github owner (org or user) of repositories permitted to deploy to AWS"
  type        = string
}
