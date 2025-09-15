// main.tf for encryption security module
// Example: Azure Key Vault for data encryption

resource "azurerm_key_vault" "data_encryption" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
  tags                = var.tags
}
