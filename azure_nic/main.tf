resource "azurerm_network_interface" "nic" {
  name                = "${var.computer_name}-nic"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.computer_name}-nic-Config"
    subnet_id                     = var.azurerm_subnet_id
    private_ip_address_allocation = "dynamic"
  }
}

output "nic_id" {
  value = azurerm_network_interface.nic.id
}
