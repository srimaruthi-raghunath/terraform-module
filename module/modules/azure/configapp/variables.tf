variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location of the Resource group"
}

variable "appconfig_name" {
  description = "App Config Name"
}

variable "appconfig_sku" {
  description = "sku - (Optional) The SKU name of the the App Configuration. Possible values are free and standard."
  default     = "standard"
}

variable "identity_type" {
  description = "type - (Required) Specifies the identity type of the App Configuration. At this time the only allowed value is SystemAssigned."
  default     = "SystemAssigned"
}
