// main.tf for access control security module
// Example: Assigning RBAC to a storage account

resource "azurerm_role_assignment" "storage_rbac" {
  scope                = var.storage_account_id
  role_definition_name = var.role_definition_name
  principal_id         = var.principal_id
}
