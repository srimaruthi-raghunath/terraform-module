output "object_id" {
  value = azurerm_app_service_slot.this.identity[0].principal_id
}

output "tenant_id" {
  value = azurerm_app_service_slot.this.identity[0].tenant_id
}