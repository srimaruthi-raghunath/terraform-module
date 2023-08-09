resource "azurerm_eventhub_namespace" "this" {
  name                = var.event_hub_namespace
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.event_hub_namespace_sku
  capacity            = var.event_hub_namespace_capacity
}

resource "azurerm_eventhub" "this" {
  name                = var.event_hub_name
  namespace_name      = azurerm_eventhub_namespace.this.name
  resource_group_name = var.resource_group_name
  partition_count     = var.event_hub_partition_count
  message_retention   = var.event_hub_message_retention
}
