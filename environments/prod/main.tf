// main.tf for prod environment
module "datalake" {
  source                = "../../modules/datalake"
  storage_account_name  = "proddatalake"
  resource_group_name   = "prod-resource-group"
  location              = "eastus"
  tags                  = {
    environment = "prod"
  }
}
