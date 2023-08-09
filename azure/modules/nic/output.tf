output "id" {
  value = azurerm_network_interface.this.id
}
output "ip" {
  value = azurerm_network_interface.this.private_ip_address
}