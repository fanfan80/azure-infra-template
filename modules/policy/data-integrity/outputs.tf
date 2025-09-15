// outputs.tf for data integrity policy module
output "storage_account_id" {
	description = "The ID of the storage account with integrity protection"
	value       = azurerm_storage_account.integrity.id
}
