resource "azurerm_linux_virtual_machine" "this" {
  name                            = var.vmname
  location                        = var.location
  resource_group_name             = var.resource_group_name
  network_interface_ids           = var.nicid
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  size                            = var.imgsize
  disable_password_authentication = false

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = var.os_storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.osversion
    version   = "latest"
  }

}
