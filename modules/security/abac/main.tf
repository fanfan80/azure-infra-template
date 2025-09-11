# ABAC Submodule for Security

resource "azurerm_role_assignment" "abacAssignment" {
  scope                = var.scope
  role_definition_name = var.roleDefinitionName
  principal_id         = var.principalId
  condition            = var.condition
  condition_version    = var.conditionVersion
}
