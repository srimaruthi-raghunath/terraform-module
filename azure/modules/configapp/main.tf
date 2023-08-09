resource "azurerm_app_configuration" "this" {
  name                = var.appconfig_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.appconfig_sku
  identity {
    type = var.identity_type
  }
}
