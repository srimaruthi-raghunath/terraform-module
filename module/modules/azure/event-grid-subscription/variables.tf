variable "event_grid_subscription_name" {
  description = "name of the subscription"
}

variable "event_grid_id" {
  description = "id of event grid toipc"

}
variable "advanced_filtering_on_arrays_enabled" {
  default = true
}

variable "max_events_per_batch" {
  default = 1

}

variable "preferred_batch_size_in_kilobytes" {

  default = 64
}

variable "created_function_name" {
  description = "fucntion name created inside fucntion example WonderlandDraftPreview it's part of func-westus-mam-integrations-ingest-dev function"
}

variable "functionapp_id" {
  description = "id of function example:func-westus-mam-integrations-ingest-dev "
}
