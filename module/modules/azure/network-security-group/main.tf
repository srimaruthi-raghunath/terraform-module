data "azurerm_network_security_group" "nsg" {
  name                = var.nsgname
  resource_group_name = var.resource_group_name
}