resource "azurerm_linux_virtual_machine" "this" {
    name                  = var.vmname
    location              = var.location
    resource_group_name   = var.resource_group_name
    network_interface_ids = var.nicid
    admin_username        = var.username
    admin_password        = var.password
    size                  = var.imgsize
    disable_password_authentication = false

    os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = var.osversion
        version   = "latest"
    }

       	    
    
}

  