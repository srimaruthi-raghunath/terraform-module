
# Use existing resource group
module "azurerm_resource_group" {
  source              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/resourcegroup?ref=main"
  resource_group_name = var.resource_group_name
}

# Create New Storage account

module "azurerm_storage_account" {
  source                                = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/storageaccount?ref=main"
  storage_account_name                  = var.storage_account_name
  resource_group_name                   = module.azurerm_resource_group.name
  location                              = module.azurerm_resource_group.location
  storage_account_tier                  = var.storage_account_tier
  storage_account_name_replication_type = var.storage_account_name_replication_type
}
