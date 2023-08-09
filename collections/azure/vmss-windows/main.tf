module "azurerm_resource_group" {
  source              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/resourcegroup?ref=main"
  resource_group_name = var.resource_group_name
}

module "azurerm_virtual_vnetsubet" {
  source              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/vnet-subnet?ref=main"
  vnetname            = var.vnetname
  subnetname          = var.subnetname
  resource_group_name = module.azurerm_resource_group.name
}

module "azurerm_network_security_group" {
  source              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/network-security-group?ref=main"
  nsgname             = var.nsgname
  resource_group_name = module.azurerm_resource_group.name
}

# create new network network_interface
module "azurerm_network_interface" {
  source              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure//network-interface?ref=main"
  resource_group_name = module.azurerm_resource_group.name
  location            = module.azurerm_resource_group.location
  nic-name            = var.nic-name
  ipname              = var.ipname
  subnetid            = module.azurerm_virtual_vnetsubet.subnetid
}

# use existing keyvault to read 
module "azurerm_key_vault" {
  source                              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/data-key-vault?ref=main"
  keyvault_name                       = var.keyvault_name
  keyvault_resource_group_name        = var.keyvault_resource_group_name
  keyvault_admin_password_secret_name = var.keyvault_admin_password_secret_name

}

module "azurerm_image" {
  source                     = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/image?ref=main"
  custom_image               = var.custom_image
  customimage_resource_group = var.customimage_resource_group
}

module "azurerm_proximity_placement_group" {
  source               = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/proximity-placement-group?ref=main"
  proximity_group_name = var.proximity_group_name
  location             = module.azurerm_resource_group.location
  resource_group_name  = module.azurerm_resource_group.name
}

module "vmss" {
  source                       = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/vmss-windows?ref=main"
  vmss_name                    = var.vmss_name
  location                     = module.azurerm_resource_group.location
  resource_group_name          = module.azurerm_resource_group.name
  source_image_id              = module.azurerm_image.id
  proximity_placement_group_id = module.azurerm_proximity_placement_group.id
  computer_prefix              = var.computer_prefix
  proximity_group_name         = var.proximity_group_name
  sku                          = var.sku
  admin_username               = var.admin_username
  admin_password               = module.azurerm_key_vault.value
  os_storage_account_type      = var.os_storage_account_type
  extra_disk                   = var.extra_disk
  subnet_id                    = module.azurerm_virtual_vnetsubet.subnetid
}

