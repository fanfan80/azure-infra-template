// outputs.tf for data disposal policy module
output "disposal_policy_id" {
	description = "The ID of the storage management disposal policy"
	value       = azurerm_storage_management_policy.disposal_policy.id
}
