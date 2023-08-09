output "id" {
  value       = data.azurerm_network_security_group.nsg.id
  description = "The Network Security Group ID"
}