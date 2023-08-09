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
resource "azurerm_virtual_machine_extension" "name" {
  name =  "vmextension"
  virtual_machine_id = azurerm_linux_virtual_machine.this.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
  {
    "fileUris": ["https://azp112sa.blob.core.windows.net/testcon/file.sh?sp=r&st=2022-08-01T09:49:38Z&se=2022-08-01T17:49:38Z&spr=https&sv=2021-06-08&sr=b&sig=NQlLBAgzsVkzLhNYeClk2MSrSCin%2F8BRI1R7%2FQXq3V4%3D"],  
     "commandToExecute": "sh file.sh"
     
  }
  SETTINGS
}


// resource "null_resource" "copy-test-file" {

//   connection {
//     type     = "ssh"
//     host     = azurerm_linux_virtual_machine.this.private_ip_address
//     user     = var.username
//     password = var.password
//     port = 22
//   }
//      provisioner "file" {
//        source = "./file.sh"
//        destination = "/tmp/file.sh"
//    }
//    provisioner "remote-exec" {
//     inline = [
//         "sudo apt-get update -y",
//         "sudo apt-get install dos2unix -y",
//         "dos2unix /tmp/file.sh",
//         "chmod +x /tmp/file.sh",
//         "/bin/bash -x /tmp/file.sh > /tmp/bug"
          
//     ]
   
//    }
// }
  