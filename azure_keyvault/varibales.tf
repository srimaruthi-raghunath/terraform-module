variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]'"
  type        = string
}

variable "keyvault_name" {
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created. ."
  type        = string
}

variable "sku_name" {
  description = "he Name of the SKU used for this Key Vault. Possible values are standard and premium"
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
  description = "this value is true this resoruce is going to create"
  type        = bool
  default     = false
}
