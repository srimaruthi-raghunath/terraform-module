variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location of the Resource group"
}

variable "storage_account_name" {
  description = ""
}

variable "storage_account_tier" {
  description = "Standard and Premium"
}

variable "storage_account_name_replication_type" {
  description = "LRS,ZRS"
}

variable "quota" {
  description = " quota of the shared drive ex: 1gb to 500 gb"
}