# Use existing resource group
data "azurerm_resource_group" "resource" {
  name = var.resource_group_name
}

#storage accopunt 
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = data.azurerm_resource_group.resource.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_name_replication_type
}