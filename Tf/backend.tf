terraform {
  backend "azurerm" {
    storage_account_name = azurerm_storage_account.storage1.name
    container_name       = azurerm_storage_container.continer1.name
    key                  = "terraform.tfstate"
  }
}