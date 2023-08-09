resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                            = var.vmss_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  sku                             = var.sku
  instances                       = var.instances
  upgrade_mode                    = "Manual"
  source_image_id                 = var.source_image_id
  proximity_placement_group_id    = var.proximity_placement_group_id
  computer_name_prefix            = var.computer_prefix
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  overprovision                   = var.overprovision

  os_disk {
    storage_account_type = var.os_storage_account_type
    caching              = "ReadWrite"
  }
  data_disk {
    lun                  = 0
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    create_option        = "Empty"
    disk_size_gb         = var.extra_disk

  }

  identity {
    type = "SystemAssigned"
  }

  network_interface {
    name    = "vmssinterface"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id

    }
  }
}