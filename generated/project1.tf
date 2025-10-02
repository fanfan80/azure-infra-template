
  
resource "azurerm_storage_account" "datalakedevraw" {
  name                = "datalakedevraw"
  resource_group_name = "dataops_rg"
  location            = "Australia East"
  account_tier        = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled      = true
  access_tier         = "Hot"
  tags                = { env = "dev", owner = "team-a" }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalakedevraw_fs" {
  name               = "raw"
  storage_account_id = azurerm_storage_account.datalakedevraw.id
}
  
resource "azurerm_storage_account" "datalakedevcurated" {
  name                = "datalakedevcurated"
  resource_group_name = "dataops_rg"
  location            = "Australia East"
  account_tier        = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled      = true
  access_tier         = "Hot"
  tags                = { env = "dev", owner = "team-a" }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalakedevcurated_fs" {
  name               = "curated"
  storage_account_id = azurerm_storage_account.datalakedevcurated.id
}
  
resource "azurerm_storage_account" "datalakedevconformed" {
  name                = "datalakedevconformed"
  resource_group_name = "dataops_rg"
  location            = "Australia East"
  account_tier        = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled      = true
  access_tier         = "Hot"
  tags                = { env = "dev", owner = "team-a" }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalakedevconformed_fs" {
  name               = "conformed"
  storage_account_id = azurerm_storage_account.datalakedevconformed.id
}
  



# No medallion layers provided; create a single storage account
resource "azurerm_storage_account" "datalakedataopsprod" {
  name                = "datalakedataopsprod"
  resource_group_name = "dataops_rg"
  location            = "Australia East"
  account_tier        = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled      = true
  access_tier         = "Hot"
  tags                = { env = "prod", owner = "team-b" }
}
