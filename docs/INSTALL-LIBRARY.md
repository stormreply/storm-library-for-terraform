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

    <ol type="1">
    <li>In your forked storm-library-for-terraform GitHub repository, go to <i>Settings</i>
    </li>
    <li>On the left-hand side, in the<i>Security</i> section, expand <i>Secrets and variables</i>,
    then click <i>Actions</i>
    </li>
    <li>In the <i>Actions secrets and variables</i> view in the center, navigate to the
    <i>Secrets</i> tab
    </li>
    <li>In the <i>Repository secrets</i> section, click <i>New repository secret</i>
    </li>
    <li>In the <i>Actions secrets / New secret</i> form
    <ul>
    <li>use <i>STORM_LIBRARY_FOR_TERRAFORM</i> as the <i>Name</i>
    </li>
    <li>copy-paste your token from its temporary place into the <i>Secret</i> field
    </li>
    </ul>
    </li>
    <li>Click<i>Add secret</i>
    </li>
    </ol>


   You are now using the token you created with the Storm Library for Terraform

1. **Configure the Storm Library for Terraform**

    Follow these steps to configure your setup of the Storm Library for Terraform:

    <ol type="1">
    <li> In your forked <i>storm-library-for-terraform</i> GitHub repository, go to
    <i>Actions</i>
    </li>
    <li> If you click on <i>Actions</i> for the first time, you will be shown a message
    that workflows are not (yet) enabled for this repository. Enable them by
    clicking on the highlighted button.
    </li>
    <li> On the left-hand side, under <i>Actions</i>, choose and click the <i>Configure</i>
    workflow
    </li>
    <li> On the right-hand side, click <i>Run workflow</i>. Note: if you don't see the
    <i>Run workflow</i> button, you are most likely logged into GitHub with some
    other identity than the owner of the forked repository. Switch your GitHub
    identity in that case.
    </li>
    <li> In the panel that opens now:


    <ul>
    <li><i>Use workflow from</i> Branch: main
    </li>
    <li>As <i>AWS Access Domain</i>, enter the id or alias of your AWS Identity Center.
    Example: if your AWS Identity Center URL is<i>muchentuchen.awsapps.com</i>,
    your AWS Access Domain would be<i>muchentuchen</i>.
    </li>
    <li>As <i>AWS Permission Set</i>, enter AdministratorAccess or some similar permission
    set granted to you in the AWS account
    </li>
    <li>As <i>AWS Account Id</i>, enter the 12-digit account id of the AWS account where
    you intend to install your Terraform S3 backend and deploy SLT demos
    </li>
    <li>As <i>AWS Region</i>, enter the region where you want the Terraform S3 backend
    bucket installed</li>
    Example: <i>eu-central-1</i>
    </li>
    </ul>
    </li>
    <li> Click on <i>Run workflow</i>. After a few seconds, reload the page. You will see
    the <i>Configure</i> workflow being listed as <i>In progress</i> in the list of workflow
    runs.
    </li>
    <li> Click on the <i>Configure</i> workflow link. This will take you to the <i>configure
    jobs</i> overview. Both in the center view and on the left-hand side, you will
    notice jobs appear and being executed successively: <i>init</i>, <i>sso</i>,
    <i>build</i>.
    </li>
    <li> Click on the <i>sso</i> job as soon as it turns into a clickable link. You will
    notice multiple steps of the <i>sso</i> job being executed one after another.
    </li>
    <li> If not yet visible, expand the <i>get access token</i> step. Check for a line
    saying "Click the link below:"
    </li>
    <li> Click the link below. A new browser tab will open.
    </li>
    <li> If you do not have an active session with AWS Identity Center, you will be
    forced to log in first
    </li>
    <li> If you do have an active session with AWS Identity Center, you will be
    informed that authorization has been requested for your AWS account and
    resources. Confirm and proceed.
    </li>
    <li> On the next browser page you will be asked if you want to allow access to
    your data. Allow the access. You will see yet another page informing you
    that the request has been appoved. You can safely close that browser page.
    </li>
    <li> In the GitHub workflow window where you came from, you will see the workflow
    transition from <i>sso</i> to <i>build</i>
    </li>
    </ol>

    Now let's assume your AWS account id is<i>123456789012</i> and your GitHub user
    or organization's name is<i>muchentuchen</i>. The<i>Configure</i> workflow will then
    create three resources:

   - An S3 bucket named
     <i>storm\-library\-for\-terraform\-muchentuchen\-123456789012</i>, if not already
     exists. This bucket will store state files of your SLT demo deployments and
     job files for the SLT scheduler.
   - An OIDC provider for GitHub, if not already exists. This lets GitHub actions
     execute Terraform in AWS environment.
   - An IAM role in your account called
     <i>slt\-0\-storm\-library\-for\-terraform\-muchentuchen\-backend</i>.
     This role is used for accessing the S3 bucket mentioned before.
   - An IAM role in your account called
     <i>slt\-0\-storm\-library\-for\-terraform\-muchentuchen\-backend</i>.
     This role is used for creating AWS resources.
