output "vnetid" {
    value = data.azurerm_virtual_network.this.id
}

output "subnetid" {
  value = data.azurerm_subnet.this.id
}