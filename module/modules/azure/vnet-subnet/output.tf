output "vnetid" {
  value = data.azurerm_virtual_network.vnet.id
}

output "subnetid" {
  value = data.azurerm_subnet.subnet.id
}