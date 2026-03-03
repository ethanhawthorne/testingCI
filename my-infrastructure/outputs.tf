output "resource_group_name" {
  description = "Name of the created Resource Group."
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "ID of the created Resource Group."
  value       = module.resource_group.id
}

output "storage_account_name" {
  description = "Name of the created Storage Account."
  value       = module.storage_account.name
}