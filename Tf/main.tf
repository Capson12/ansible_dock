terraform {
  required_providers {
    azurerm {
        source = "hashicorp/azurerm"
        version = "3.0.0"
    } 
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg1" {
  name     = "backendApps"
  location = "South UK"
  
}


resource "azurerm_storage_account" "storage1" {
  name = "smtxbackendstorage"
  location = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  access_tier = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "continer1" {

  name = "backendstate"
  storage_account_name = azurerm_storage_account.storage1.name
  container_access_type = "private"
  
}

