data "azurerm_shared_image_version" "image" {
  name                = var.shared_image_version
  image_name          = var.image_name
  gallery_name        = var.gallery_name
  resource_group_name = var.resource_group_name
}