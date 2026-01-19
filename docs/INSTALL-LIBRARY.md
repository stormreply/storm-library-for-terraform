## Install the Storm Library for Terraform

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
   member repositories, the Storm Library for Terraform needs a GitHub token. This can either
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

    1. In your forked storm-library-for-terraform GitHub repository, go to _Settings_
    1. On the left-hand side, in the _Security_ section, expand _Secrets and variables_,
       then click _Actions_
    1. In the _Actions secrets and variables_ view in the center, navigate to the
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
    1. If you click on _Actions_ for the first time, you will be shown a message
     that workflows are not (yet) enabled for this repository. Enable them by
     clicking on the highlighted button.
    1. On the left-hand side, under _Actions_, choose and click the _Configure_
     workflow
    1. On the right-hand side, click _Run workflow_. Note: if you don't see the
       _Run workflow_ button, you are most likely logged into GitHub with some
       other identity than the owner of the forked repository. Switch your GitHub
       identity in that case.
    1. In the panel that opens now:

       - _Use workflow from_ Branch: main
       - As _AWS Access Domain_, enter the id or alias of your AWS Identity Center.
         Example: if your AWS Identity Center URL is _muchentuchen.awsapps.com_,
         your AWS Access Domain would be _muchentuchen_.
       - As _AWS Permission Set_, enter AdministratorAccess or some similar permission
         set granted to you in the AWS account
       - As _AWS Account Id_, enter the 12-digit account id of the AWS account where
         you intend to install your Terraform S3 backend and deploy SLT demos
       - As _AWS Region_, enter the region where you want the Terraform S3 backend
         bucket installed.
         Example: _eu-central-1_
    1. Click on _Run workflow_. After a few seconds, reload the page. You will see
       the _Configure_ workflow being listed as _In progress_ in the list of workflow
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

   Now let's assume your AWS account id is _123456789012_ and your GitHub user
   or organization's name is _muchentuchen_. The _Configure_ workflow will then
   create three resources:

   - An S3 bucket named
     _storm\-library\-for\-terraform\-muchentuchen\-123456789012_, if not already
     exists. This bucket will store state files of your SLT demo deployments and
     job files for the SLT scheduler.
   - An OIDC provider for GitHub, if not already exists. This lets GitHub actions
     execute Terraform in AWS environment.
   - An IAM role in your account called
     _slt\-0\-storm\-library\-for\-terraform\-muchentuchen\-backend_.
     This role is used for accessing the S3 bucket mentioned before.
   - An IAM role in your account called
     _slt\-0\-storm\-library\-for\-terraform\-muchentuchen\-backend_.
     This role is used for creating AWS resources.
