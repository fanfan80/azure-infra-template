// main.tf for Azure Data Lake Storage Gen2
resource "azurerm_storage_account" "datalake" {
	name                     = var.storage_account_name
	resource_group_name      = var.resource_group_name
	location                 = var.location
	account_tier             = "Standard"
	account_replication_type = "LRS"
	is_hns_enabled           = true
	tags                     = var.tags
}
