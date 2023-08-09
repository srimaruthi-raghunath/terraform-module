variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location of the Resource group"
}

variable "storage_account_name" {
  description = "Storage  Account Name"
}

variable "storage_account_access_key" {
  description = "Storage  Account tier"
}

/*
variable "app_settings" {
  description = "Function App config keys"
  type = map(any)
}
*/
variable "func_app_slot_name" {
  description = "Slot name"
}

variable "app_service_plan_id" {
  description = "Service Plan ID"
}

variable "function_app_name" {
  description = "function app name"
}

variable "function_app_version" {
  description = "Function APP runtime version"
  default     = "~3"
}