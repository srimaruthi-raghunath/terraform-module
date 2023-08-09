output "id" {
  value = azurerm_network_interface.nic.id
}

output "ip" {

  value = azurerm_network_interface.nic.private_ip_address #azurerm_network_interface.this.private_ip_address[count.index]
}