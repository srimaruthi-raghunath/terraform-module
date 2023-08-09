variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location of the Resource group"
}
variable "appservice_name" {
  description = "appservice_name"
}

variable "app_service_plan_id" {
  description = "app_service_plan_id"

}
variable "app_slot_name" {
  description = "app_slot_name "


}

variable "dotnet_framework_version" {
  description = "dotnet_framework_version  example v5.0"
}

variable "app_settings" {
  description = "Function App config keys"
  type        = map(any)
}

variable "identity_type" {
  description = "type - (Required) Specifies the identity type of the App Configuration. At this time the only allowed value is SystemAssigned."
  default     = "SystemAssigned"
}
