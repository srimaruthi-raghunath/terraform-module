variable "keyvault_name" {
  description = "The name of the Key Vault which contains secrets."
  type        = string
}

variable "keyvault_resource_group_name" {
  description = "The name of the resource group where Key Vault is located."
  type        = string
}

variable "keyvault_admin_password_secret_name" {
  description = "The key name of secret from Key Vault where user password is stored."
  type        = string
}