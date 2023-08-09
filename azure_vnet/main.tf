resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  resource_group_name = var.azurerm_resource_group_name
  location            = var.azurerm_resource_group_location
  address_space       = var.address_space
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}