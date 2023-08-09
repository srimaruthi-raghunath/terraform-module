output "name" {
  value       = data.azurerm_resource_group.rg.name
  description = "The resource group."
}

output "location" {
  value       = data.azurerm_resource_group.rg.location
  description = "The location of the resource group."
}