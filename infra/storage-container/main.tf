module "azurerm_resource_group" {
source = "../../azure/modules/resourcegroup"
resource_group_name = var.resource_group_name
}

module "azurerm_storage_account" {
  source  = "../../azure/modules/storage-account-containers"
  container_requied = var.container_requied
  resource_group_name = module.azurerm_resource_group.name
  location  = module.azurerm_resource_group.location
  storage_account_name =  var.storage_account_name
  storage_account_tier = var.storage_account_tier
  storage_account_name_replication_type =  var.storage_account_name_replication_type
  containers_name = var.containers_name
  container_access_type = var.container_access_type
 
}