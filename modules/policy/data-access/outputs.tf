// outputs.tf for data access policy module
output "role_assignment_id" {
	description = "The ID of the role assignment"
	value       = azurerm_role_assignment.storage_access.id
}
