#Azure provider 

provider "azurerm" {
  features {}
  subscription_id = "71d71fc5-3a74-4f1d-8603-999075cc6781"
  tenant_id       = "84970857-31fe-4ce0-977c-fceb9babdcec"
  use_azure_cli_auth = true 
}

##Resource Group
resource "azurerm_resource_group" "rg-aks" {
  name     = "rg-aks"
  location = "West Europe"
}

##Remote state file
terraform {
  backend "azurerm" {
    resource_group_name   = "rg-aks"
    storage_account_name  = "terraformstate12"
    container_name        = "tfstate"
    key                   = "aks-cluster.tfstate"
  }
}
