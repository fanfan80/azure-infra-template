// outputs.tf for data classification policy module
output "storage_account_id" {
	description = "The ID of the classified storage account"
	value       = azurerm_storage_account.classified.id
}
