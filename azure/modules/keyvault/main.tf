provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
   name = var.keyvault_name
   resource_group_name = var.resource_group_name
   location = var.location
    tenant_id = data.azurerm_client_config.current.tenant_id
   sku_name = var.sku_name
   enabled_for_disk_encryption = true
  #SP
 access_policy {
    tenant_id           = data.azurerm_client_config.current.tenant_id
    object_id           = data.azurerm_client_config.current.object_id
    key_permissions     = var.key_permissions_spn
    secret_permissions  = var.secret_permissions_spn
    storage_permissions = var.storage_permissions_spn
  }

  
}
