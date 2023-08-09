data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                        = var.keyvault_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
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

resource "azurerm_key_vault_access_policy" "this" {
  key_vault_id            = resource.azurerm_key_vault.this.id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = "c5c9cd09-7e28-4ae6-a04e-640e44924a78"
  key_permissions         = var.key_permissions_spn
  secret_permissions      = var.secret_permissions_spn
  certificate_permissions = var.certificate_permissions_spn
}

