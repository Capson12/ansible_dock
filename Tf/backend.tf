terraform {
  backend "azurerm" {
    resource_group_name = "SMTX-PLGD"
    storage_account_name = "smtxtfstate"
    container_name       = "tfstatesafe"
    key                  = "ansible_dock_file"

  }
}