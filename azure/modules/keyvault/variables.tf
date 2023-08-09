variable "keyvault_name" {
  description = "keyvault_name"
}

variable "resource_group_name" {
  description = "Resource group name"
}


variable "sku_name" {
  description = "sku_name"
  default = "standard"
}

variable "location" {
  description = "Location of the Resource group"
}

variable "key_permissions_spn" {
  description = "keys permision for spn"
  type = list(string)
}

variable "secret_permissions_spn" {
  description = "secrets permission for spn"
  type = list(string)
}

variable "storage_permissions_spn" {
  description = "storage permission for spn"
  type = list(string)
  default = []
}

variable "appconfig_tenant_id" {
    description = "appconfig tentent id"
}

variable "appconfig_object_id" {
    description = "appconfig object id"
}
variable "key_permissions_appconfig" {
  description = "keys permision for spn"
  type = list(string)
}

variable "secret_permissions_appconfig" {
  description = "secrets permission for spn"
  type = list(string)
}

variable "storage_permissions_appconfig" {
  description = "storage permission for spn"
  type = list(string)
  default = []
}



variable "jobcatalog_tenant_id" {
    description = "jobcatalog_tenant_id"
}

variable "jobcatalog_object_id" {
    description = "jobcatalog_object_id"
}
variable "key_permissions_jobcatalog" {
  description = "keys permision for spn"
  type = list(string)
}

variable "secret_permissions_jobcatalog" {
  description = "secrets permission for spn"
  type = list(string)
}

variable "storage_permissions_jobcatalog" {
  description = "storage permission for spn"
  type = list(string)
  default = []
}
