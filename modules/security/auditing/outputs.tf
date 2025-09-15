// outputs.tf for auditing security module
output "storage_account_id" {
  description = "The ID of the audited storage account"
  value       = azurerm_storage_account.audited.id
}
