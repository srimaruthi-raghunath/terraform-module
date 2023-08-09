resource "azurerm_cdn_profile" "this" {
  name                = var.cdn_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.cdn_sku
}