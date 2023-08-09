resource "azurerm_key_vault_secret" "this" {
  for_each     = var.kyv_secrets
  name         = each.value.key_name
  value        = each.value.key_value
  key_vault_id = var.key_vault_id
}
