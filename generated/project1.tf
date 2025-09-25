resource "azurerm_storage_account" "datalakemadalliondev" {
  name                     = "datalakemadalliondev"
  resource_group_name      = "dataops_rg"
  location                 = "Australia East"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
  access_tier              = "Hot"
  tags                     = { env = "dev", owner = "team-a" }
}



resource "azurerm_storage_data_lake_gen2_filesystem" "datalakemadalliondev_bronze" {
  name               = "bronze"
  storage_account_id = azurerm_storage_account.datalakemadalliondev.id
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalakemadalliondev_silver" {
  name               = "silver"
  storage_account_id = azurerm_storage_account.datalakemadalliondev.id
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalakemadalliondev_gold" {
  name               = "gold"
  storage_account_id = azurerm_storage_account.datalakemadalliondev.id
}



resource "azurerm_storage_account" "datalakedataopsprod" {
  name                     = "datalakedataopsprod"
  resource_group_name      = "dataops_rg"
  location                 = "Australia East"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
  access_tier              = "Hot"
  tags                     = { env = "prod", owner = "team-b" }
}

