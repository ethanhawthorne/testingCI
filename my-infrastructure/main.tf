terraform {
  required_version = ">= 1.5.0"

  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  effective_resource_group_name = var.resource_group_name != "" ? var.resource_group_name : "${var.project_name}-${var.environment}-rg"
  storage_account_name          = "st${substr(md5(local.effective_resource_group_name), 0, 22)}"
}

module "resource_group" {
  source   = "./modules/resource-group"
  name     = local.effective_resource_group_name
  location = var.location
  tags     = var.tags
}

module "storage_account" {
  source                   = "./modules/storage-account"
  name                     = local.storage_account_name
  resource_group_name      = module.resource_group.name
  location                 = module.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}