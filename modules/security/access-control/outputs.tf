// outputs.tf for access control security module
output "role_assignment_id" {
  description = "The ID of the role assignment"
  value       = azurerm_role_assignment.storage_rbac.id
}
