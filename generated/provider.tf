terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.45"
    }
  }
  required_version = ">= 1.5"
}

provider "azurerm" {
  features {}
  subscription_id = "86d4d36b-be35-4891-a5d7-9bdf82b5c168"
}
