resource "azurerm_network_interface" "nic" {
  name                = var.nic-name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ipname
    subnet_id                     = var.subnetid
    private_ip_address_allocation = "Dynamic"
  }

}
