variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location of the Resource group"
}

variable "service_plan_name" {
  description = ""
}

variable "service_plan_tier" {
  description = ""
}

variable "service_plan_size" {
  description = ""
}

variable "app_service_plan_kind" {
  description = "(Optional) The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
  default = "FunctionApp"
}