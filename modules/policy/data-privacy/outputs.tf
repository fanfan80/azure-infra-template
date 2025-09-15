// outputs.tf for data privacy policy module
output "storage_account_id" {
	description = "The ID of the storage account with privacy controls"
	value       = azurerm_storage_account.privacy.id
}

output "private_endpoint_id" {
	description = "The ID of the private endpoint"
	value       = azurerm_private_endpoint.storage_pe.id
}
