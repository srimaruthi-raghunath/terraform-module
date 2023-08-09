resource "azurerm_network_interface_security_group_association" "this" {
  network_security_group_id = var.nsgid
  network_interface_id      = var.nicid

}
