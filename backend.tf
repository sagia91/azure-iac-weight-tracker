terraform {
  #azure tfstate hosting
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate10491"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}