variable "keyvault_name" {
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created. The name must be globally unique. If the vault is in a recoverable state then the vault will need to be purged before reusing the name."
}

variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]'"
}

variable "sku_name" {
  description = "sku_name"
  default     = "standard"
}

variable "location" {
  description = "location of existing resoruce group location"

}

variable "key_permissions_spn" {
  description = "keys permision for spn ist of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and WrapKey."
  type        = list(string)
}

variable "secret_permissions_spn" {
  description = "secrets permission for spn   List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set"
  type        = list(string)
}

variable "certificate_permissions_spn" {
  description = "certificate permission for spn  List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update."
  type        = list(string)

}


