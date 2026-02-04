# Storm Library for Terraform

The Storm Library for Terraform is a collection of Terraform modules for Amazon Web Services.
The focus of these modules, maintained in separate GitHub™ repositories, is on **building examples,**
**demos and showcases on AWS**. The audience of the library is learners and presenters alike - people
that want to know or show how a certain service, pattern or solution looks like, or "feels".

In order to be able to try out these examples, demos and showcases quickly, the Storm Library
for Terraform additionally provides a set of GitHub workflows which allow for terraform plan, apply
and destroy them in an AWS environment. Optionally, a simple scheduler can be activated to destroy
modules after a given time automatically or to deploy them with a delay, if necessary.

## Building parts

The Storm Library for Terraform is made up of four building parts:

### The Catalog ###

A catalog of GitHub repositories contributing to the SLT.
[The catalog](https://github.com/stormreply/storm-library-for-terraform/blob/main/catalog.yaml)
is a yaml file containing
metadata for each contributing repository like a catalog number, the GitHub URL, a short description,
authors, publishing date and other items. The catalog is located in this very repository,
[storm-library-for-terraform](https://github.com/stormreply/storm-library-for-terraform).

More about the catalog

### The Scheduler ###

The Scheduler is based on the
[GitHub Scheduler](https://docs.github.com/de/actions/reference/workflows-and-actions/workflow-syntax#onschedule)
and checks for scheduled terraform apply or destroy
jobs every 4 hours by default. Jobs are managed as S3 objects containing a timestamp and metadata
both in their name and in their data. The scheduler is also part of this repository.

More about the scheduler

### The Workflows ###

Every SLT _member_ repository **must** contain the same set of
[GitHub workflows](https://docs.github.com/en/actions/concepts/workflows-and-actions/workflows).
These workflows are merely triggers for
[reusable workflows](https://docs.github.com/en/actions/how-tos/reuse-automations/reuse-workflows)
implemented in the
[slt-workflows](https://github.com/stormreply/slt-workflows)
repository that can be used to
[terraform plan](https://developer.hashicorp.com/terraform/cli/commands/plan),
[apply](https://developer.hashicorp.com/terraform/cli/commands/apply),
test and
[destroy](https://developer.hashicorp.com/terraform/cli/commands/destroy)
resources in the SLT member repository immediately and easily.

More about the workflows

### The SLT repositories ###

The SLT "member" repositories are designed to contain examples, demos and showcases. However they
could also contain best patterns or reusable modules; there is no strict rule about their essence
apart from that users must be able to plan, apply, test and destroy them from the common set of
GitHub workflows. Every member repository tries to implement best practices and enforce them to
some extent by using
[pre-commit](https://github.com/pre-commit/pre-commit)
hooks, however this approach may sometimes reach its limits for the sake of the example, demo
 or showcase.

More about the member repositories

### Dependencies within the SLT

![Building Parts](assets/slt-building-parts.svg)

## Installation

[Install the Storm Library for Terraform](docs/INSTALL-LIBRARY.md)

## Deploy a member repository

[Deploy a member repository](docs/DEPLOY-MEMBER.md)

## Terraform Docs

<details>
<summary>Klicke zum Anzeigen</summary>

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws\_iam\_role.terraform\_backend\_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws\_iam\_role.terraform\_deployment\_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws\_iam\_role\_policy.terraform\_backend\_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws\_iam\_role\_policy\_attachment.terraform\_deployment\_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws\_caller\_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws\_iam\_policy\_document.github\_oidc\_trust\_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws\_iam\_policy\_document.terraform\_backend\_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input__metadata"></a> [\_metadata](#input\_\_metadata) | n/a | <pre>object({<br/>    actor      = string # Github actor (deployer) of the deployment<br/>    catalog_id = string # SLT catalog id of this module<br/>    deployment = string # slt-<catalod_id>-<repo>-<actor><br/>    ref        = string # Git reference of the deployment<br/>    ref_name   = string # Git ref_name (branch) of the deployment<br/>    repo       = string # GitHub short repository name (without owner) of the deployment<br/>    repository = string # GitHub full repository name (including owner) of the deployment<br/>    sha        = string # Git (full-length, 40 char) commit SHA of the deployment<br/>    short_name = string # slt-<catalog_id>-<actor><br/>    time       = string # Timestamp of the deployment<br/>  })</pre> | <pre>{<br/>  "actor": "",<br/>  "catalog_id": "",<br/>  "deployment": "",<br/>  "ref": "",<br/>  "ref_name": "",<br/>  "repo": "",<br/>  "repository": "",<br/>  "sha": "",<br/>  "short_name": "",<br/>  "time": ""<br/>}</pre> | no |
| <a name="input_backend_bucket"></a> [backend\_bucket](#input\_backend\_bucket) | Central backend bucket of the Storm Library for Terraform (SLT)™ | `string` | n/a | yes |
| <a name="input_oidc_principal"></a> [oidc\_principal](#input\_oidc\_principal) | Github owner (org or user) of repositories permitted to deploy to AWS | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output__default_tags"></a> [\_default\_tags](#output\_\_default\_tags) | n/a |
| <a name="output__metadata"></a> [\_metadata](#output\_\_metadata) | n/a |
| <a name="output__name_tag"></a> [\_name\_tag](#output\_\_name\_tag) | n/a |
<!-- END_TF_DOCS -->

</details>

## Contribute

The SLT is intended to be a community project.
