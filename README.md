# SLT | Storm Library for Terraform

The SLT | Storm Library for Terraform is a collection of Terraform modules for Amazon Web Services.
The focus of these modules, maintained in separate GitHub™ repositories, is on building examples,
demos and showcases on AWS. The audience of the library is learners and presenters alike - people
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

### The Scheduler ###

The Scheduler is based on the
[GitHub Scheduler](https://docs.github.com/de/actions/reference/workflows-and-actions/workflow-syntax#onschedule)
and checks for scheduled terraform apply or destroy
jobs every 4 hours. Jobs are managed as S3 objects containing a timestamp and metadata both in their
name and in their data. The scheduler is also part of this repository.


### The Workflows ###

Every repository of the SLT must contain the same set of
[GitHub workflows](https://docs.github.com/en/actions/concepts/workflows-and-actions/workflows)
. These workflows are merely triggers
for
[reusable workflows](https://docs.github.com/en/actions/how-tos/reuse-automations/reuse-workflows)
implemented in the
[slt-workflows](https://github.com/stormreply/slt-workflows)
repository.

### The Demos ###


![Building Parts](assets/slt-building-parts.svg)


## Installation



## Contribute

The SLT is intended to be a community project.
