variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location of the Resource group"
}

variable "storage_account_name" {
    description = "Storage  Account Name" 
}

variable "storage_account_primary_access_key" {
   description = "Storage  Account tier"
}

variable "function_app_name" {
    description = "Function App name"
}
/*
variable "app_insgihts_instrumentation_key" {
  description = "Key for app_insights"
}
*/
variable "identity_type" {
  description = "(Required) Specifies the identity type of the Function App. Possible values are SystemAssigned (where Azure will generate a Service Principal for you), UserAssigned where you can specify the Service Principal IDs in the identity_ids field, and SystemAssigned, UserAssigned which assigns both a system managed identity as well as the specified user assigned identities."
  default = "SystemAssigned"
}

variable "function_app_version" {
  description = "Function APP runtime version"
  default = "~3"
}

variable "app_settings" {
  description = "Function App config keys"
  type = map(any)
}

variable "app_service_plan_id" {
  description = "app service plan id"
}

variable "min_tls" {
  description = "(Optional) The minimum supported TLS version for the function app. Possible values are 1.0, 1.1, and 1.2. Defaults to 1.2 for new function apps."
  default = 1.2
}

/*
variable "app_service_plan_id" {
  description = "Service Plan ID"
}

variable "appinsgihts_key" {
  description = "app insights keys"
}

variable "function_key" {
  description = "function key"
}
*/