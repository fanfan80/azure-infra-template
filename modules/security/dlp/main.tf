// main.tf for data loss prevention (DLP) security module
// Example: Azure Policy to restrict public access to storage accounts

resource "azurerm_policy_definition" "dlp_policy" {
  name         = var.policy_name
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Restrict Public Access to Storage Accounts"
  description  = "Prevents public access to storage accounts."

  policy_rule = <<POLICY
{
  "if": {
    "field": "Microsoft.Storage/storageAccounts/allowBlobPublicAccess",
    "equals": true
  },
  "then": {
    "effect": "deny"
  }
}
POLICY
}
