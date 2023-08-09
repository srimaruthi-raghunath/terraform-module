resource "azurerm_windows_virtual_machine" "this" {
    name                  = var.vmname
    location              = var.location
    resource_group_name   = var.resource_group_name
    network_interface_ids = var.nicid
    admin_username        = var.username
    admin_password        = var.password
    size                  = var.imgsize
 

 os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    #disk_size_gb = var.disk_size_gb
  }

   source_image_reference {
    publisher = var.publisher
    offer      = var.offer
    sku       = var.osversion
    version   = "latest"
  }
  
}

