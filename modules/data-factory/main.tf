# Azure Data Factory Module

resource "azurerm_resource_group" "datafactory" {
  name     = var.resourceGroupName
  location = var.location
}

resource "azurerm_data_factory" "datafactory" {
  name                = var.dataFactoryName
  location            = azurerm_resource_group.datafactory.location
  resource_group_name = azurerm_resource_group.datafactory.name
}
