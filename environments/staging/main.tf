// main.tf for staging environment
module "datalake" {
  source                = "../../modules/datalake"
  storage_account_name  = "stagingdatalake"
  resource_group_name   = "staging-resource-group"
  location              = "eastus"
  tags                  = {
    environment = "staging"
  }
}
