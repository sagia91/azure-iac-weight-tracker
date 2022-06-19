terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.10.0"
    }
  }

  #azure tfstate hosting
  /*backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate10491"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }*/
}

provider "azurerm" {
  features {}
}