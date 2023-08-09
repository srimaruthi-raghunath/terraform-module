variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]'"
}

variable "vnetname" {
  description = "Specifies the name of the Virtual Network."
}

variable "subnetname" {
  description = "Specifies the name of the Subnet."
}

variable "nsgname" {
  description = "Specifies the Name of the Network Security Group."
}

variable "nic-name" {
  description = "The name of the network interface. Changing this forces a new resource to be created"
}

variable "ipname" {
  description = "User-defined name of the IP"
}

variable "keyvault_name" {
  description = "The name of the Key Vault which contains secrets."
  type        = string
}

variable "keyvault_resource_group_name" {
  description = "The name of the resource group where Key Vault is located."
  type        = string
}

variable "keyvault_admin_password_secret_name" {
  description = "The key name of secret from Key Vault where user password is stored."
  type        = string
}

variable "custom_image" {
  description = "image name from which you want to deploy VMSS instance"
}
variable "customimage_resource_group" {
  description = "custom image resource group name"
}

variable "proximity_group_name" {
  description = " Specifies the name of the availability set. Changing this forces a new resource to be created."
}

variable "vmss_name" {
  description = "name of the VMSS creating"
}

variable "computer_prefix" {
  description = "name of the instance created"
}

variable "sku" {
  description = "To check the size of the resources that will be created. To check use command: 'az vm list-sizes --location <location>' to obtain list"
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created"
}

variable "os_storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values include Standard_LRS, StandardSSD_LRS, StandardSSD_ZRS, Premium_LRS and Premium_ZRS"
}

variable "extra_disk" {
  description = "extra disk for vmss we can take 10 gb"
}