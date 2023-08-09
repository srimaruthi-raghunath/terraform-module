resource "azurerm_function_app" "this" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_primary_access_key
  version                    = var.function_app_version
  https_only                 = true
  site_config {
    min_tls_version = var.min_tls
  }

  identity {
    type = var.identity_type
  }
  app_settings = var.app_settings

}