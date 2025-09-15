// main.tf for data governance policy module
// Example: Azure Policy Assignment for governance

resource "azurerm_policy_assignment" "governance_assignment" {
	name                 = var.assignment_name
	scope                = var.scope
	policy_definition_id = var.policy_definition_id
}
