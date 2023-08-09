variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
}

variable "resource_group_location" {
  description = "(Optional) The location in which the resources will be created."
  type        = string
}

variable "computer_name" {
  type = string
}

variable "azurerm_subnet_id" {
  type = string
}