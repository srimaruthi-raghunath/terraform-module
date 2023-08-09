resource "azurerm_function_app_slot" "this" {
  name                       = var.func_app_slot_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  function_app_name          = var.function_app_name
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  version                    = var.function_app_version
}