# My Infrastructure

Simple Terraform project for Azure using a reusable module for Resource Groups.

## Structure

- `main.tf`: Root configuration (provider, module call, storage account)
- `variables.tf`: Root input variables
- `outputs.tf`: Root outputs
- `terraform.tfvars`: Environment values
- `modules/resource-group/main.tf`: Resource Group resource
- `modules/resource-group/variables.tf`: Module inputs
- `modules/resource-group/outputs.tf`: Module outputs

## How the module is used

The root module calls the local module:

- Module source: `./modules/resource-group`
- Inputs: `name`, `location`, `tags`
- Outputs consumed by root: `name`, `location`, `id`

The storage account in root uses the module outputs so resources stay connected:

- Resource group name: `module.resource_group.name`
- Location: `module.resource_group.location`

## Common commands

From this folder (`my-infrastructure`):

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## State migration note (already done)

When moving from a direct resource to a module, Terraform resource addresses change.
To avoid recreation, move state:

```bash
terraform state mv azurerm_resource_group.rg module.resource_group.azurerm_resource_group.this
```

After that, `terraform plan` should show no changes if config and state match.
