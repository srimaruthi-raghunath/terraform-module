output "object_id" {
  value = azurerm_function_app.this.identity[0].principal_id
}

output "tenant_id" {
  value = azurerm_function_app.this.identity[0].tenant_id
}

output "name" {
  value = azurerm_function_app.this.name
}

output "id" {
  value = azurerm_function_app.this.id
}
