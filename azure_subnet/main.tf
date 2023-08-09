resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes
  resource_group_name  = var.azurerm_resource_group_name
  service_endpoints    = var.service_endpoints
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}