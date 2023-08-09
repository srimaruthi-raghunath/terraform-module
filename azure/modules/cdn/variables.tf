variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location of the Resource group"
}

variable "cdn_name" {
  description = "(Required) Specifies the name of the CDN Profile. Changing this forces a new resource to be created."
}

variable "cdn_sku" {
  description = "(Required) The pricing related information of current CDN profile. Accepted values are Standard_Akamai, Standard_ChinaCdn, Standard_Microsoft, Standard_Verizon or Premium_Verizon."
  default = "Standard_Microsoft"
}
