
# Use existing resource group
module "azurerm_resource_group" {
  source              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//infra/modules/resourcegroup?ref=main"
  resource_group_name = var.resource_group_name
}

# Create New Keyvault
module "azurerm_key_vault" {
  source                      = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//infra/modules/keyvault?ref=main"
  keyvault_name               = var.keyvault_name
  resource_group_name         = module.azurerm_resource_group.name
  location                    = module.azurerm_resource_group.location
  sku_name                    = var.sku_name
  key_permissions_spn         = var.key_permissions_spn
  secret_permissions_spn      = var.secret_permissions_spn
  certificate_permissions_spn = var.certificate_permissions_spn
}
