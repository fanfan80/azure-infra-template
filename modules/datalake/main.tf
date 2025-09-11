# Azure Data Lake Storage Gen2 Module

resource "azurerm_resource_group" "datalake" {
  name     = var.resourceGroupName
  location = var.location
}

resource "azurerm_storage_account" "datalake" {
  name                     = var.storageAccountName
  resource_group_name      = azurerm_resource_group.datalake.name
  location                 = azurerm_resource_group.datalake.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
}

resource "azurerm_storage_container" "datalakeContainer" {
  name                  = var.containerName
  storage_account_id    = azurerm_storage_account.datalake.id
  container_access_type = var.containerAccessType
}
