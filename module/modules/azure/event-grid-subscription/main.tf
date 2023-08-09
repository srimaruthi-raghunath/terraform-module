resource "azurerm_eventgrid_event_subscription" "default" {

  name  = var.event_grid_subscription_name
  scope = var.event_grid_id

  azure_function_endpoint {
    function_id                       = "${var.functionapp_id}/functions/${var.created_function_name}"
    max_events_per_batch              = var.max_events_per_batch
    preferred_batch_size_in_kilobytes = var.preferred_batch_size_in_kilobytes
  }
  advanced_filtering_on_arrays_enabled = var.advanced_filtering_on_arrays_enabled

}
