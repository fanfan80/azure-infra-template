// outputs.tf for data usage policy module
output "policy_definition_id" {
	description = "The ID of the usage policy definition"
	value       = azurerm_policy_definition.restrict_storage_usage.id
}
