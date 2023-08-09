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
    identity {
    type = "SystemAssigned"
  }
}

  
resource "azurerm_virtual_machine_extension" "name" {
  name =  "vmextension"
  virtual_machine_id = azurerm_windows_virtual_machine.this.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

   settings = <<SETTINGS
  {
    "fileUris": ["https://azp112sa.blob.core.windows.net/testcon/windowfile.ps1?sp=r&st=2022-08-01T10:44:45Z&se=2022-08-01T18:44:45Z&sv=2021-06-08&sr=b&sig=xzMimy%2FVIXiuUgMNSLn2CSLiJwJic2nc1FFwXdBNGe0%3D"],  
     "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File windowfile.ps1",
     "managedIdentity" : {}
   }  
  SETTINGS

}


# resource "null_resource" "copy-test-file" {

#   connection {
#     type = "winrm"
#     host     = azurerm_windows_virtual_machine.this.private_ip_address
#     user     = var.username
#     password = var.password
#     port = 3389
#   }
#   #    provisioner "file" {
#   #      source = "./file.sh"
#   #      destination = "/tmp/file.sh"
#   #  }
#    provisioner "remote-exec" {
#     inline = [
#         "powershell.exe windowsfile.ps1"
          
#     ]
   
#    }
# }
  
