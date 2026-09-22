# Day 05 – Terraform Variables

## Task

- Add an input variable named `env` and set its default value to `staging`.
- Create a `terraform.tfvars` file and set the environment value to `demo`.
- Test variable precedence by passing the variable in different ways:
  - Default value
  - Environment variable
  - `terraform.tfvars`
  - Custom `.tfvars` file
  - Command-line argument

## Variable Declaration

The `variables.tf` file is used to declare variables and define their name, type, description, default value, and additional metadata.

```hcl
variable "env" {
  description = "The environment type."
  type        = string
  default     = "staging"
}
```

## Assigning Values Using `terraform.tfvars`

A `.tfvars` file is used to provide actual variable values during Terraform execution.

It allows us to define values specific to an environment, such as:

- Number of virtual machines
- VM size
- Database type, tier, or SKU
- Resource names
- Environment name

Create a file named `terraform.tfvars`:

```hcl
env = "demo"
```

Terraform automatically loads the `terraform.tfvars` file when running:

```bash
terraform plan
```

## Using Environment Variables

Terraform variables can be passed as environment variables using the `TF_VAR_` prefix:

```bash
export TF_VAR_env="qa"
terraform plan
```

If `terraform.tfvars` also defines `env`, its value takes precedence over the environment variable.

## Using Custom `.tfvars` Files

Different `.tfvars` files can be created for different environments.

For example:

### `dev.tfvars`

```hcl
env = "dev"
```

### `prod.tfvars`

```hcl
env = "prod"
```

Pass the required variable file using the `-var-file` option:

```bash
terraform plan -var-file="dev.tfvars"
```

```bash
terraform plan -var-file="prod.tfvars"
```

## Using the `-var` Command-Line Option

A variable can also be passed directly from the command line:

```bash
terraform plan -var="env=test"
```

In this example:

```hcl
var.env = "test"
```

## Terraform Variable Precedence

Terraform variable precedence, from lowest to highest, is:

1. Default value in the variable declaration
2. Environment variable such as `TF_VAR_env`
3. `terraform.tfvars`
4. `terraform.tfvars.json`
5. `*.auto.tfvars` or `*.auto.tfvars.json`
6. Command-line options such as `-var-file` and `-var`

For command-line options, Terraform processes them in the order provided. If the same variable is assigned more than once, the last command-line value wins.

Example:

```bash
terraform plan -var="env=dev"
```

Here, `var.env` becomes `dev` and overrides:

```hcl
default = "staging"
```

```hcl
env = "demo" # terraform.tfvars
```

```bash
export TF_VAR_env="qa"
```

## Using the Variable in a Resource

Declaring and assigning a variable is not enough. The resource must reference it using `var.env`.

```hcl
resource "azurerm_storage_account" "example" {
  name                     = "techtutorial101"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    env = var.env
  }
}
```

If the tag is written as `env = "staging"`, it is hardcoded and variable precedence will not affect it.