output "object_id" {
  value = azurerm_app_service.this.identity[0].principal_id
}

output "tenant_id" {
  value = azurerm_app_service.this.identity[0].tenant_id
}

output "appservice_name" {
  value = azurerm_app_service.this.name
}
