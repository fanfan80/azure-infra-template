// outputs.tf for encryption security module
output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.data_encryption.id
}
