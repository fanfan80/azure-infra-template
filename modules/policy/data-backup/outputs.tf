// outputs.tf for data backup policy module
output "vault_id" {
	description = "The ID of the Recovery Services Vault"
	value       = azurerm_recovery_services_vault.backup_vault.id
}

output "backup_policy_id" {
	description = "The ID of the backup policy"
	value       = azurerm_backup_policy_vm.backup_policy.id
}
