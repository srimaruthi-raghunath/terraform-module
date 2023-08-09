data "azurerm_image" "image" {
  name                = var.custom_image
  resource_group_name = var.customimage_resource_group
}