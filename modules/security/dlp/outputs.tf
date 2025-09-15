// outputs.tf for data loss prevention (DLP) security module
output "dlp_policy_id" {
  description = "The ID of the DLP policy definition"
  value       = azurerm_policy_definition.dlp_policy.id
}
