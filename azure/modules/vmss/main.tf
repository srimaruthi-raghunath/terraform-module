#  data "azurerm_image" "this" {
#    name                =  var.cusimage
#    resource_group_name = var.custom_resource_group_name
# }


resource "azurerm_virtual_machine_scale_set" "this" {
  name                = var.vmssname
  resource_group_name = var.resource_group_name
  location = var.location
  upgrade_policy_mode = "Manual"
  
  sku {
   name     = var.imgtype
   capacity = 1
   tier     = "Standard"
 }
 storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = var.osversion
    version   = "latest"
  }

   storage_profile_os_disk {
   name              = ""
   caching           = "ReadWrite"
   create_option     = "FromImage"
   managed_disk_type = "Standard_LRS"
  
  }
  os_profile {
   computer_name_prefix = "vmlab"
   admin_password      = var.password
  admin_username      = var.vmuser
 }
 
 network_profile {
   name    = "customvmss"
   primary = true

   ip_configuration {
     name                                   = "IPConfiguration"
     subnet_id                              = var.subnetid
     primary = true
   }
 }
 
}