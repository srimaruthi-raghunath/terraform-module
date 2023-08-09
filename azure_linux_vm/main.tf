resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.computer_name
  location                        = var.resource_group_location
  resource_group_name             = var.resource_group_name
  network_interface_ids           = [var.network_interface_id]
  encryption_at_host_enabled      = true
  size                            = var.size
  computer_name                   = var.computer_name
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  os_disk {
    name                 = "${var.computer_name}_OsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.disk_size_gb
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.boot_storage_account_uri
  }
}