// main.tf for auditing security module
// Example: Enable diagnostic logging for a storage account

resource "azurerm_storage_account" "audited" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "azurerm_storage_account_management_policy" "audit_policy" {
  storage_account_id = azurerm_storage_account.audited.id
  // Add rules for logging and retention as needed
}
