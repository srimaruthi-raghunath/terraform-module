variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]'"
  type        = string
}

variable "new_keyvault_name" {
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created. ."
  type        = string
}

variable "sku_name" {
  description = "he Name of the SKU used for this Key Vault. Possible values are standard and premium"
  default     = "standard"
}

variable "key_permissions_spn" {
  description = "List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy, and SetRotationPolicy"
  type        = list(string)
}

variable "secret_permissions_spn" {
  description = "List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set"
  type        = list(string)
}

variable "certificate_permissions_spn" {
  description = "ist of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update"
  type        = list(string)
}

variable "user_obj_id" {
  description = "user object id to give permission to user"
}

variable "userpermission" {
  description = "This value is true this resoruce is going to create"
  type        = bool
  default     = false
}

variable "storage_account_name" {
  description = "Specifies the name of the storage account."
  type        = string
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created"
  type        = string
}

variable "storage_account_name_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa"
  type        = string
}

variable "virtual_network_name" {
  type        = string
  description = "Virtual network name. List virtual networks. To check use command: 'az network vnet list'"
}

variable "subnet_name" {
  type    = string
  default = "Subnet name. List the subnets in a virtual network. To check use command: 'az network vnet subnet list"
}

variable "nsg_name" {
  type    = string
  default = "Network security group name.	List network security groups. To check use command: 'az network nsg list'"
}

variable "container_name" {
  type    = string
  default = "Name of the container needs to be created"
}
