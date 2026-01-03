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

1. **[Fork the Storm Library for Terraform](https://github.com/stormreply/storm-library-for-terraform/fork)
   on GitHub**

1. **Create a GitHub token**

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

1. **Configure the token for use with the Storm Library for Terraform**

   - In your forked storm-library-for-terraform GitHub repository, go to
     _Settings_
   - On the left-hand side, in the _Security_ section, expand _Secrets and
     variables_, then click _Actions_
   - In the _Actions secrets and variables_ view in the center, navigate to
     the _Secrets_ tab
   - In the _Repository secrets_ section, click _New repository secret_
   - In the _Actions secrets / New secret_ form
     - use _STORM\_LIBRARY\_FOR\_TERRAFORM_ as the _Name_
     - copy-paste your token from its temporary place into the _Secret_ field
   - Click _Add secret_

   You are now using the token you created with the Storm Library for Terraform

1. **Configure the Storm Library for Terraform**

   Follow these steps to configure your setup of the Storm Library for Terraform:

   - In your forked _storm-library-for-terraform_ GitHub repository, go to _Actions_
   - If you click on _Actions_ for the first time, you will be shown a message
     that workflows are not (yet) enabled for this repository. Enable them by
     clicking on the highlighted button.
   - On the left-hand side, under _Actions_, choose and click the _Configure_
     workflow
   - On the right-hand side, click _Run workflow_. Note: if you don't see the
     _Run workflow_ button, you are most likely logged into GitHub with some
     other identity than the owner of the forked repository. Switch your GitHub
     identity in that case.
   - In the panel that opens now:
     - _Use workflow from_ Branch: main
     - As _AWS Access Domain_, enter the id or alias of your AWS Identity Center.
       Example: if your AWS Identity Center URL is _muchentuchen.awsapps.com_,
       your AWS Access Domain would be _muchentuchen_.
     - As _AWS Access Role_, enter AdministratorAccess or some similar permission
       set granted to you in the AWS account
     - As _AWS Account_, enter the 12-digit account id of the AWS account where
       you intend to install your Terraform S3 backend and deploy SLT demos
     - As _AWS Region_, enter the region where you want the Terraform S3 backend
       bucket installed.
       Example: _eu-central-1_
   - Click on _Run workflow_. After a few seconds, reload the page. You will see
     the _Configure_ workflow being listed as _In progress_ in the list of workflow
     runs.
   - Click on the _Configure_ workflow link. This will take you to the _configure_
     jobs overview. Both in the center view and on the left-hand side, you will
     notice jobs appear and being executed successively: _init_, _sso_, _build_.
   - Click on the _sso_ job as soon as it turns into a clickable link. You will
     notice multiple steps of the _sso_ job being executed one after another.
   - If not yet visible, expand the _get access token_ step. Check for a line
     saying "Click the link below:"
   - Click the link below. A new browser tab will open.
   - If you do not have an active session with AWS Identity Center, you will be
     forced to log in first
   - If you do have an active session with AWS Identity Center, you will be
     informed that authorization has been requested for your AWS account and
     resources. Confirm and proceed.
   - On the next browser page you will be asked if you want to allow access to
     your data. Allow the access. You will see yet another page informing you
     that the request has been appoved. You can safely close that browser page.
   - In the GitHub workflow window where you came from, you will see the workflow
     transition from _sso_ to _build_

   Now let's assume your AWS account id is _123456789012_ and your GitHub user
   or organization's name is _muchentuchen_. The _Configure_ workflow will then
   create three resources:

   - An S3 bucket named
     _storm\-library\-for\-terraform\-muchentuchen\-123456789012_.
     This bucket will store state files of your SLT demo deployments and job files
     for the SLT scheduler.
   - An IAM role in your account called
     _slt\-0\-storm\-library\-for\-terraform\-muchentuchen\-backend_.
     This role is used for accessing the S3 bucket mentioned before.
   - An IAM role in your account called
     _slt\-0\-storm\-library\-for\-terraform\-muchentuchen\-backend_.
     This role is used for creating AWS resources.

1. **Deploy a member repository**

   - Fork the member repository on GitHub, e.g.
   [slt-member-example](https://github.com/stormreply/slt-member-example/fork)
   - In your forked repository on GitHub, click _Settings_
   - On the left-hand side, in the _Security_ section, expand _Secrets and
     variables_, then click _Actions_
   - In the _Actions secrets and variables_ view in the center, navigate to
     the _Variables_ tab
   - In the _Repository variables_ section, click _New repository variables_
   - In the _Actions variables / New variable_ form, set
     - _Name_: _BACKEND\_ACCOUNT_
     - in _Value_, enter the account id of your AWS Account that you defined
       in the _Configure_ action of your forked _storm\-library\-for\-terraform_
   - Click _Add variable_
   - Add a second variable with
     - _Name_: _BACKEND\_REGION_
     - _Value_: The AWS Region that you defined in the _Configure_ action of your
     forked _storm\-library\-for\-terraform_
   - In your repository's top bar tab row, click in _Actions_
   - If you click on _Actions_ for the first time, you will be shown a message
     that workflows are not (yet) enabled for this repository. Enable them by
     clicking on the highlighted button.
   - On the left-hand side, under _Actions_, you will find common Terraform
     commands implemented as GitHub workflows:
     - _Plan_: Plan a Terraform module: Make a plan of what will be created
     - _Apply_: Create / deploy the resources defined in the Terraform module
     - _Destroy_: Destroy the resources that have been created with _Apply_
     - _Test_: executes _Plan_, _Apply_ and _Destroy_ one after the other
   - Click on the _Test_ workflow
   - On the right-hand side, click _Run workflow_. Note: if you don't see the
     _Run workflow_ button, you are most likely logged into GitHub with some
     other identity than the owner of the forked repository. Switch your GitHub
     identity in that case.
   - In the panel that opens now, _Use workflow from_ Branch: main, then click
     on _Run workflow_ on that panel. After a few seconds, reload the page. You
     will see the _Test_ workflow being listed as _In progress_ in the list of
     workflow runs.

   The _Test_ workflow will take a few minutes to execute. If _Test_ passes with
   green lights all over, you successfully installed the SLT | Storm Library for
   Terraform!

## Contribute

The SLT is intended to be a community project.
