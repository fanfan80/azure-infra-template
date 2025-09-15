// outputs.tf for data retention policy module
output "management_policy_id" {
	description = "The ID of the storage management policy"
	value       = azurerm_storage_management_policy.retention_policy.id
}
