resource "azurerm_virtual_network" "vnet1" {
    name = "smtx_vnet"
    resource_group_name = azurerm_resource_group.rg1.name
    location = azurerm_resource_group.rg1.location
    address_space = ["10.12.0.0/16"]

    subnet {

        name = "smtx_sub1"
        address_prefix = "10.12.3.0/24"
    }

  
}
