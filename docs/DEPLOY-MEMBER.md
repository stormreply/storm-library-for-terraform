## Deploy a member repository

  1. Fork the member repository on GitHub, e.g.
     [slt-member-example](https://github.com/stormreply/slt-member-example/fork)
  1. In your forked repository on GitHub, click _Settings_
  1. On the left-hand side, in the _Security_ section, expand _Secrets and
     variables_, then click _Actions_
  1. In the _Actions secrets and variables_ view in the center, navigate to
     the _Variables_ tab
  1. In the _Repository variables_ section, click _New repository variables_
  1. In the _Actions variables / New variable_ form, set
     - _Name_: _BACKEND\_ACCOUNT_
     - in _Value_, enter the account id of your AWS Account that you defined
     in the _Configure_ action of your forked _storm\-library\-for\-terraform_
  1. Click _Add variable_
  1. Add a second variable; set
     - _Name_: _BACKEND\_REGION_
     - _Value_: The AWS Region that you defined in the _Configure_ action of your
     forked _storm\-library\-for\-terraform_
  1. In your repository's top bar tab row, click in _Actions_
  1. If you click on _Actions_ for the first time, you will be shown a message
     that workflows are not (yet) enabled for this repository. Enable them by
     clicking on the highlighted button.
  1. On the left-hand side, under _Actions_, you will find common Terraform
     commands implemented as GitHub workflows:
     - _Plan_: Plan a Terraform module: Make a plan of what will be created
     - _Apply_: Create / deploy the resources defined in the Terraform module
     - _Destroy_: Destroy the resources that have been created with _Apply_
     - _Test_: executes _Plan_, _Apply_ and _Destroy_ one after the other
  1. Click on the _Apply_ workflow
  1. On the right-hand side, click _Run workflow_. Note: if you don't see the
     _Run workflow_ button, you are most likely not logged into GitHub as the
     owner of the forked repository but with some other identity. Switch your
     GitHub identity in that case.
  1. In the panel that opens now, _Use workflow from_ Branch: main, then click
     on _Run workflow_ on that panel. Ignore the other input options for the
     moment. After a few seconds, reload the page. You will see the _Apply_
     workflow being listed as _In progress_ in the list of workflow runs.

   The _Apply_ workflow will take a few minutes to execute. If _Apply_ passes
   with green lights all over, you successfully installed the Storm Library for
   Terraform!

   You can now login into your AWS account and check the example resource
   deployed from the _slt-member-example_ repository. It's just a simple
   security group. Check the tags attached to the security group.

   If you think you've seen enough, use the _Destroy_ workflow to destroy the
   resource. Again, ignore other input options of the _Destroy_ workflow for
   the moment. Destruction will again take a minute or two. Check your AWS
   account to verify that the security group resource has been deleted.

   Now you're ready to build other demos! Check the
   [catalog](https://github.com/stormreply/storm-library-for-terraform/blob/main/catalog.yaml)
   to find what else can be built with the Storm Library for Terraform!
