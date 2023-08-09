variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]'"
}

variable "location" {
  description = "location of existing resoruce group location"

}

variable "storage_account_name" {
  description = "pecifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group"
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
}

variable "storage_account_name_replication_type" {
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa"
}

variable "container_requied" {
  description = "count for creating the container"
  type        = bool

}

variable "containers_name" {
  description = "containers_name of storage"
  type        = string
}

variable "container_access_type" {
  description = "container_access_type "
  type        = string
}
