output "storageAccountName" {
  description = "The name of the Data Lake storage account"
  value       = azurerm_storage_account.datalake.name
}

output "containerName" {
  description = "The name of the Data Lake container"
  value       = azurerm_storage_container.datalakeContainer.name
}
