// outputs.tf for data governance policy module
output "policy_assignment_id" {
	description = "The ID of the policy assignment"
	value       = azurerm_policy_assignment.governance_assignment.id
}
