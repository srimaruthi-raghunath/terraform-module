# Use existing resource group
module "azurerm_resource_group" {
  source              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/resourcegroup?ref=main"
  resource_group_name = var.resource_group_name
}


# Use existing vnet and subnet 

module "azurerm_virtual_network" {
  source              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/vnet-subnet?ref=main"
  resource_group_name = module.azurerm_resource_group.name
  vnetname            = var.vnetname
  subnetname          = var.subnetname
}

# create new network network_interface
module "azurerm_network_interface" {
  source              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/network-interface?ref=main"
  resource_group_name = module.azurerm_resource_group.name
  location            = module.azurerm_resource_group.location
  nic-name            = var.nic-name
  ipname              = var.ipname
  subnetid            = module.azurerm_virtual_network.subnetid
}

# Use exisiing netework security group
module "azurerm_network_security_group" {
  source              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/network-security-group?ref=main"
  resource_group_name = module.azurerm_resource_group.name
  nsgname             = var.nsgname
}

# use existing keyvault to read 
module "azurerm_key_vault" {
  source                              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/data-key-vault?ref=main"
  keyvault_name                       = var.keyvault_name
  keyvault_resource_group_name        = var.keyvault_resource_group_name
  keyvault_admin_password_secret_name = var.keyvault_admin_password_secret_name

}

# create Windows vm
module "azurerm_windows_virtual_machine" {
  source                  = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/vm-windows?ref=main"
  vmname                  = var.vmname
  location                = module.azurerm_resource_group.location
  resource_group_name     = module.azurerm_resource_group.name
  nicid                   = [module.azurerm_network_interface.id]
  admin_username          = var.admin_username
  admin_password          = module.azurerm_key_vault.value
  imgsize                 = var.imgsize
  os_storage_account_type = var.os_storage_account_type
  publisher               = var.publisher
  offer                   = var.offer
  osversion               = var.osversion
}

