output "abacAssignmentId" {
  description = "The ID of the ABAC role assignment"
  value       = azurerm_role_assignment.abacAssignment.id
}
