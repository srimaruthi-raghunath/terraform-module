data "azurerm_virtual_network" "this" {
    name = var.vnetname
    resource_group_name = var.resource_group_name
}


data "azurerm_subnet" "this" {
    name = var.subnetname
    resource_group_name = var.resource_group_name
    virtual_network_name = data.azurerm_virtual_network.this.name
}