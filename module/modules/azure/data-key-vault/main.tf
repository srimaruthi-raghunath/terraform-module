# Use existing Key Vault
data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_resource_group_name
}

# Get user password secret from Key Vault
data "azurerm_key_vault_secret" "admin_password" {
  name         = var.keyvault_admin_password_secret_name
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

