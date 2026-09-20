terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
             version = "~> 4.8.0" #azure rm provider version # Sets the AzureRM plugin version
        }
    }
    required_version = ">=1.9.0"# Sets the Terraform version

}

provider "azurerm" {
  features {
}
}




resource "azurerm_resource_group" "cidaas-rg" {
  name     = "cidaas-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "cidaas-sa" {
  name                     = "cidaasstorageaccount"
  resource_group_name      = azurerm_resource_group.cidaas-rg.name
  location                 = azurerm_resource_group.cidaas-rg.location #implicit dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}