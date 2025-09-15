// main.tf for data access policy module
// Example: Assigning access policy to a storage account

resource "azurerm_role_assignment" "storage_access" {
	scope                = var.storage_account_id
	role_definition_name = var.role_definition_name
	principal_id         = var.principal_id
}
