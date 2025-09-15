// main.tf for data classification policy module
// Example: Tagging resources for data classification

resource "azurerm_storage_account" "classified" {
	name                     = var.storage_account_name
	resource_group_name      = var.resource_group_name
	location                 = var.location
	account_tier             = "Standard"
	account_replication_type = "LRS"
	tags = {
		classification = var.classification
	}
}
