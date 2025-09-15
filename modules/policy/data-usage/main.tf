// main.tf for data usage policy module
// Example: Azure Policy to restrict storage account usage

resource "azurerm_policy_definition" "restrict_storage_usage" {
	name         = var.policy_name
	policy_type  = "Custom"
	mode         = "All"
	display_name = "Restrict Storage Account Usage"
	description  = "Restricts usage of storage accounts to specific allowed SKUs."

	policy_rule = <<POLICY
{
	"if": {
		"field": "Microsoft.Storage/storageAccounts/sku.name",
		"notIn": ["Standard_LRS", "Standard_GRS"]
	},
	"then": {
		"effect": "deny"
	}
}
POLICY
}
