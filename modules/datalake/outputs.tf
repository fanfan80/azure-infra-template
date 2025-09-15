// outputs.tf for Azure Data Lake Storage Gen2
output "storage_account_id" {
  description = "The ID of the Data Lake storage account"
  value       = azurerm_storage_account.datalake.id
}
