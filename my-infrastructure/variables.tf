variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
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
    managed_by  = "terraform"
  }
}