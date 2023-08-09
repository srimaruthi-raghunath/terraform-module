resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_name_replication_type
}

resource "azurerm_storage_container" "this" {
  count                 = var.container_requied == true ? 1 : 0
  name                  = var.containers_name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = var.container_access_type
}
