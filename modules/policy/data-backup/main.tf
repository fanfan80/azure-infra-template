// main.tf for data backup policy module
// Example: Azure Recovery Services Vault and Backup Policy
// main.tf for data backup policy module
// Example: Azure Recovery Services Vault and Backup Policy
// Already provided above

resource "azurerm_recovery_services_vault" "backup_vault" {
	name                = var.vault_name
	location            = var.location
	resource_group_name = var.resource_group_name
	sku                 = "Standard"
	tags                = var.tags
}

resource "azurerm_backup_policy_vm" "backup_policy" {
	name                = var.policy_name
	resource_group_name = var.resource_group_name
	recovery_vault_name = azurerm_recovery_services_vault.backup_vault.name

	backup {
		frequency = "Daily"
		time      = "23:00"
	}

	retention_daily {
		count = 30
	}
}
