output "id" {
  value = azurerm_lb.this.id
}

output "backedid" {
  value = [azurerm_lb_backend_address_pool.this.id]
}