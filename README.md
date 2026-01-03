# SLT | Storm Library for Terraform

The SLT | Storm Library for Terraform is a collection of Terraform modules for Amazon Web Services.
The focus of these modules, maintained in separate GitHub™ repositories, is on **building examples,**
**demos and showcases on AWS**. The audience of the library is learners and presenters alike - people
that want to know or show how a certain service, pattern or solution looks like, or "feels".

In order to be able to try out these examples, demos and showcases quickly, the SLT | Storm Library
for Terraform additionally provides a set of GitHub workflows which allow for terraform plan, apply
and destroy them in an AWS environment. Optionally, a simple scheduler can be activated to destroy
modules after a given time automatically or to deploy them with a delay, if necessary.

## Building parts

The SLT | Storm Library for Terraform is made up of four building parts:

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

Every SLT "member" repository **must** contain the same set of
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

1. **Preconditions**

   In order to build a demo straight from the Storm Library for Terraform you need

   - Access to a GitHub account or GitHub organization
   - Permission to create a Personal Access Token in your GitHub account/organization
   - An AWS account accessible via AWS Identity Center (aws login coming soon!)
   - AdministratorAccess or similar permission set granted to you in the AWS account

2. **[Fork](https://docs.github.com/de/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo) the Storm Library for Terraform on GitHub**

   During the fork process, you are being informed that the repository is containing
   workflows

3. **[Fork](https://docs.github.com/de/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo) the Demo Repository on GitHub**

4. **Create a GitHub Token**

   For saving configuration state and for the scheduler to be able to execute workflows in your SLT
   member repositories, the SLT | Storm Library for Terraform needs a GitHub token. This can either
   be a GitHub App Token or a Personal Access Token.

   For
   [configuring a Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token):

   - Consider a token with **expiry** over an unlimited one
   - **Repository access** must include the SLT and all repositories that you want to build
   - The minimum set of **repository permissions** for the token is

     <table>
       <tr><td><b>Actions</b></td><td>read and write</td></tr>
       <tr><td><b>Contents</b></td><td>read-only</td></tr>
       <tr><td><b>Metadata</b></td><td>read-only</td></tr>
       <tr><td><b>Variables</b></td><td>read and write</td></tr>
     </table>

    After creation, the token will be shown to you just once. Copy it to a temporary place.

5. **Configure the token for use with the Storm Library for Terraform**

   5.1 In your forked storm-library-for-terraform GitHub repository, go to
       _Settings_


   5.2 On the left-hand side, in the _Security_ section, expand _Secrets and
       variables_, then click _Actions_


   5.3 In the _Actions secrets and variables_ view in the center, navigate to the
       _Secrets_ tab


   1. In the _Repository secrets_ section, click _New repository secret_
   1. In the _Actions secrets / New secret_ form
      - use _STORM\_LIBRARY\_FOR\_TERRAFORM_ as the _Name_
      - copy-paste your token from its temporary place into the _Secret_ field
   1. Click _Add secret_

   You are now using the token you created with the Storm Library for Terraform

1. **Configure the Storm Library for Terraform**

   Follow these steps to configure your setup of the Storm Library for Terraform:

   1. In your forked _storm-library-for-terraform_ GitHub repository, go to _Actions_
   1. On the left-hand side, under _Actions_, choose and click the _Configure_ workflow
   1. On the right-hand side, click _Run workflow_. Note: if you don't see the
      _Run workflow_ button, you are most likely logged into GitHub with some
      other identity than the owner of the forked repository. Switch your GitHub
      identity in that case.
   1. In the panel that opens now:
      - **Use workflow from** Branch: main
      - As **AWS Access Domain**, enter the id or alias of your AWS Identity Center.
        Example: if your AWS Identity Center URL is mad.awsapps.com, your AWS Access
        Domain would be "mad"
      - As **AWS Access Role**, enter AdministratorAccess or some similar permission
        set granted to you in the AWS account
      - As **AWS Account**, enter the 12-digit account id of the AWS account where
        you intend to install your Terraform S3 backend and deploy SLT demos
      - As **AWS Region**, enter the region where you want the Terraform S3 backend
        bucket installed.
        Example: eu-central-1
   1. Click on _Run workflow_. After a few seconds, reload the page. You will see
      the "Configure" workflow being listed as _In progress_ in the list of workflow
      runs.
   1. Click on the _Configure_ workflow link. This will take you to the _configure_
      jobs overview. Both in the center view and on the left-hand side, you will
      notice jobs appear and being executed successively: _init_, _sso_, _build_.
   1. Click on the _sso_ job as soon as it turns into a clickable link. You will
      notice multiple steps of the _sso_ job being executed one after another.
   1. If not yet visible, expand the _get access token_ step. Check for a line
      saying "Click the link below:"
   1. Click the link below. A new browser tab will open.
   1. If you do not have an active session with AWS Identity Center, you will be
      forced to log in first
   1. If you do have an active session with AWS Identity Center, you will be
      informed that authorization has been requested for your AWS account and
      resources. Confirm and proceed.
   1. On the next browser page you will be asked if you want to allow access to
      your data. Allow the access. You will see yet another page informing you
      that the request has been appoved. You can safely close that browser page.
   1. In the GitHub workflow window where you came from, you will see the workflow
      transition from _sso_ to _build_

   The _Configure_ workflow will create three resources:

   - An S3 bucket in your account, named _storm-library-for-terraform_, succeeded
     by your GitHub user or organization name and your AWS account id, example:
     _storm-library-for-terraform-muchentuchen-123456789012,
     where _muchentuchen_ would be your GitHub user or organization name and
     123456789012 your AWS account id. This bucket will store state files of your
     SLT demo deployments and job files for the SLT scheduler.
   - A Terraform _backend_ IAM role
   - A Terraform _deployment_ IAM role

1. **Configure the Demo Repository**

1. **Deploy the Demo**

## Contribute

The SLT is intended to be a community project.
