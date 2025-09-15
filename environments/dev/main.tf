// main.tf for dev environment
module "datalake" {
  source                = "../../modules/datalake"
  storage_account_name  = "devdatalake"
  resource_group_name   = "dev-resource-group"
  location              = "eastus"
  tags                  = {
    environment = "dev"
  }
}
