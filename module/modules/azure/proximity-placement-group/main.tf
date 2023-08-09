resource "azurerm_proximity_placement_group" "proximity" {
  name                = var.proximity_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
}