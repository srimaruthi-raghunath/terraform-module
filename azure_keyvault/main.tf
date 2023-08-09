
data "azurerm_client_config" "current" {}

# Use existing resource group
data "azurerm_resource_group" "resource" {
  name = var.resource_group_name
}

resource "azurerm_key_vault" "keyvault" {
  name                        = var.keyvault_name
  resource_group_name         = var.resource_group_name
  location                    = data.azurerm_resource_group.resource.location
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.sku_name
  enabled_for_disk_encryption = true

  #SP
  access_policy {
    tenant_id               = data.azurerm_client_config.current.tenant_id
    object_id               = data.azurerm_client_config.current.object_id
    key_permissions         = var.key_permissions_spn
    secret_permissions      = var.secret_permissions_spn
    certificate_permissions = var.certificate_permissions_spn
  }
}

#access policy to any user
resource "azurerm_key_vault_access_policy" "policy" {
  count                   = var.userpermission == true ? 1 : 0
  key_vault_id            = resource.azurerm_key_vault.keyvault.id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = var.user_obj_id
  key_permissions         = var.key_permissions_spn
  secret_permissions      = var.secret_permissions_spn
  certificate_permissions = var.certificate_permissions_spn

}
