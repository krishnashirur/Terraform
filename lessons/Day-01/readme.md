# Day 01: Introduction to Infrastructure as Code and Terraform

Notes and diagrams from the Day 01 video.

## What Is Infrastructure as Code?

Infrastructure as Code (IaC) means provisioning and managing infrastructure through code instead of creating and configuring resources manually through a cloud portal.

## Why Do We Use Infrastructure as Code?

We can create resources manually from the Azure portal by logging in, selecting the required services, and configuring them.

So, why should we write code when the same resources can be created through the portal?

## Example: Three-Tier Application

Assume that we need to provision the infrastructure required to deploy a three-tier application.

Creating all the resources manually may take approximately two hours.

Manual provisioning may be fine for a personal project or while learning Azure.

However, in a company, we may need to create the same infrastructure for multiple environments:

* Development
* Testing
* Staging
* Production

If one environment takes two hours, creating four environments may take approximately eight hours.

The process becomes more difficult when we need to:

* Deploy hundreds of servers and cloud resources
* Maintain identical configurations across environments
* Create and decommission temporary infrastructure regularly
* Prevent unused resources from increasing costs
* Reproduce a production environment for troubleshooting
* Avoid the “it works on my machine” problem
* Track changes made to the infrastructure
* Reduce mistakes caused by manual configuration

Infrastructure as Code helps automate the provisioning, management, and destruction of infrastructure.

## Benefits of Infrastructure as Code

* Consistent environments
* Write once and deploy multiple times
* Faster infrastructure provisioning
* Reduced manual effort
* Fewer human errors
* Better cost tracking
* Cost savings through automated cleanup
* Easy creation and destruction of environments
* Infrastructure changes can be tracked using Git
* Easy creation of identical environments for troubleshooting
* Developers can focus more on application development
* Improved reliability, efficiency, and security

## What Is Terraform?

Terraform is an Infrastructure as Code tool developed by HashiCorp.

It allows us to define infrastructure using configuration files and provision resources on cloud platforms such as Azure, AWS, and Google Cloud.

## How Terraform Works

The basic Terraform workflow is:

1. Write the Terraform configuration files.
2. Run the required Terraform commands.
3. Terraform loads the configured provider.
4. The provider communicates with the cloud platform through its API.
5. The requested infrastructure is provisioned.

```text
Terraform configuration files
        ↓
Terraform commands
        ↓
Terraform provider
        ↓
Cloud provider API
        ↓
Infrastructure provisioned
```

## Terraform Workflow

The main Terraform phases are:

```text
init → validate → plan → apply → destroy
```

### `terraform init`

Initializes the Terraform working directory and downloads the required providers.

### `terraform validate`

Checks whether the Terraform configuration is valid.

### `terraform plan`

Displays the infrastructure changes Terraform will make without applying them.

### `terraform apply`

Creates or updates the infrastructure based on the Terraform configuration.

### `terraform destroy`

Deletes the infrastructure managed by Terraform.
