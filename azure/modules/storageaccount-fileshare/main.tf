resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_name_replication_type
}

resource "azurerm_storage_share" "example" {
  name                 = "sharedrive1"
  storage_account_name = azurerm_storage_account.this.name
  quota =  var.quota
}