# Use existing resource group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}
# Use existing virtual network
data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.rg.name
}
# Use existing subnet
data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
}
# Use existing NSG.
data "azurerm_network_security_group" "rg" {
  name                = var.nsg_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_network_interface" "vmss" {
  name                = var.vmss_nic
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "vmss-nic-Config"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_proximity_placement_group" "proximity-group" {
  name                = var.proximity_group_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_image" "customimage" {
  name                = var.custom_image
  resource_group_name = var.customimage_resource_group
}


resource "azurerm_windows_virtual_machine_scale_set" "vmss-name" {
  name                         = var.vmss_name
  location                     = data.azurerm_resource_group.rg.location
  resource_group_name          = data.azurerm_resource_group.rg.name
  upgrade_mode                 = "Manual"
  instances                    = 1
  source_image_id              = data.azurerm_image.customimage.id
  proximity_placement_group_id = azurerm_proximity_placement_group.proximity-group.id
  computer_name_prefix         = var.computer_prefix
  sku                          = var.sku
  admin_username               = var.admin_username
  admin_password               = data.azurerm_key_vault_secret.admin_password.value #var.admin-password
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
      subnet_id = data.azurerm_subnet.subnet.id

    }
  }

}

# Use existing Key Vault
data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_resource_group_name
}

# Get user password secret from Key Vault
data "azurerm_key_vault_secret" "admin_password" {
  name         = var.keyvault_admin_password_secret_name
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

