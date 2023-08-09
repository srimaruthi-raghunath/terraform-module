 data "azurerm_image" "this" {
  name                =  var.cusimage
  resource_group_name = var.custom_resource_group_name
}


resource "azurerm_windows_virtual_machine_scale_set" "this" {
  name                = var.vmssname
  resource_group_name = var.resource_group_name
  location = var.location
  sku                 = "Standard_D4s_v3"
  instances           = 1
  admin_password      = var.password
  admin_username      = var.vmuser
  upgrade_mode = "Automatic"
  source_image_id = data.azurerm_image.this.id
  #  source_image_reference {
  #   publisher = "MicrosoftWindowsDesktop"
  #   offer     = "Windows-10"
  #   sku       = "rs5-enterprise-standard"
  #   version   = "latest"
  # }
  
  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  #  data_disk {
  #   lun           = 0
  #   caching       = "ReadWrite"
  #   create_option = "Empty"
  #   disk_size_gb  = 10
  
  #  storage_account_type = "Standard_LRS"
  # }
  identity {
     type = "SystemAssigned"
  }

  network_interface {
    name    = "vmssinterface"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnetid #azurerm_subnet.this.id
      # load_balancer_backend_address_pool_ids = [var.backendpoolid]#[azurerm_lb_backend_address_pool.scalesetpool.id]
    }    
  }
 
 
}

resource "azurerm_virtual_machine_scale_set_extension" "this" {
  name                         = "testscript"
  virtual_machine_scale_set_id = azurerm_windows_virtual_machine_scale_set.this.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "2.0"
  settings = <<SETTINGS
   {

    "fileUris": ["https://azp145rgdiag.blob.core.windows.net/powershellagentinstallationscript/enableagent.ps1?sp=r&st=2022-11-17T09:36:11Z&se=2022-11-30T17:36:11Z&sv=2021-06-08&sr=b&sig=nCSZ6L2t35cNQEgNnClBQZ5FgPNFoxkMDpQSPmjPu94%3D"],

     "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File enableagent.ps1",

     "managedIdentity" : {}

  }
  SETTINGS
}


