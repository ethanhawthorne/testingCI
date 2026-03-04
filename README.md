# Terraform CI/CD Repository

## CI/CD Workflows

This repository uses two workflows:

- `.github/workflows/terraform-ci.yml`
	- Terraform quality pipeline for infrastructure changes
	- Runs fmt/init/validate, optional plan + PR comment when Azure secrets exist
- `.github/workflows/foundations-ci.yml`
	- Continuous integration + deployment pipeline
	- Runs tests/quality checks, builds Docker image, conditionally pushes to ACR, and applies Terraform on `main`

## Task 2 Flow (Continuous Deployment)

### Pull Requests and non-main branches

- Run `test` and `build` jobs
- Run `terraform_plan` preview (no backend, no apply)

### Main branch pushes

- Run `test` and `build`
- Run `push_image` (push image to Azure Container Registry)
- Run `terraform_deploy` (remote backend init, plan, apply)

## Required GitHub Secrets

Set these in repository settings:

- `AZURE_CLIENT_ID`
- `AZURE_TENANT_ID`
- `AZURE_SUBSCRIPTION_ID`
- `ACR_NAME`
- `ACR_LOGIN_SERVER` (example: `myregistry.azurecr.io`)
- `TF_STATE_RESOURCE_GROUP`
- `TF_STATE_STORAGE_ACCOUNT`
- `TF_STATE_CONTAINER`
- `TF_STATE_KEY` (example: `dev.terraform.tfstate`)

## Terraform Environment Convention

- Dev defaults are in `my-infrastructure/environments/dev.tfvars`
- Resource names use `project_name` + `environment`
- To add prod later, create `my-infrastructure/environments/prod.tfvars` and mirror the deploy job with prod variables/state key
