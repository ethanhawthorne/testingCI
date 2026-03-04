variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
  default     = ""
}

variable "project_name" {
  description = "Short project identifier used in resource naming."
  type        = string
  default     = "testingci"
}

variable "environment" {
  description = "Deployment environment name (for example: dev, prod)."
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region for the resources."
  type        = string
  default     = "UK South"
}

variable "tags" {
  description = "Tags to apply to Azure resources."
  type        = map(string)
  default = {
    environment = "dev"
    project     = "testingci"
    managed_by  = "terraform"
  }
}