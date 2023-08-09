variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
}

variable "resource_group_location" {
  description = "(Optional) The location in which the resources will be created."
  type        = string
}

variable "sku" {
  type = string
}

variable "publisher" {
  type = string
}

variable "offer" {
  type = string
}

variable "disk_size_gb" {
  type = number
}
variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "size" {
  type = string
}

variable "computer_name" {
  type = string
}

variable "network_interface_id" {
  type = string
}

variable "boot_storage_account_uri" {
  type = string
}