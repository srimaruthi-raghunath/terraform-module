

resource "azurerm_app_service_slot" "this" {
  name                = var.app_slot_name
  app_service_name    = var.appservice_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id
  app_settings        = var.app_settings
  identity {
    type = var.identity_type
  }

  site_config {
    dotnet_framework_version  = var.dotnet_framework_version
    use_32_bit_worker_process = false
  }

}