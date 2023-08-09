output "tenant_id" {
  value = azurerm_app_configuration.this.identity[0].tenant_id
}

output "object_id" {
  value = azurerm_app_configuration.this.identity[0].principal_id
}

output "endpoint" {
  value = azurerm_app_configuration.this.endpoint

}
