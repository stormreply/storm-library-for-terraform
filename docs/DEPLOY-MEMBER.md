# Deploy a member repository**

   1. Fork the member repository on GitHub, e.g.
   [slt-member-example](https://github.com/stormreply/slt-member-example/fork)
   2. In your forked repository on GitHub, click _Settings_
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
   - Add a second variable; set
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
   green lights all over, you successfully installed the Storm Library for
   Terraform!
