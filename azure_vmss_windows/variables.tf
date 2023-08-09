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

variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]'"
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created"
}

variable "subnet_name" {
  type    = string
  default = "Subnet name. List the subnets in a virtual network. To check use command: 'az network vnet subnet list"
}

variable "virtual_network_name" {
  type        = string
  description = "Virtual network name. List virtual networks. To check use command: 'az network vnet list'"
}
variable "nsg_name" {
  type    = string
  default = "Network security group name.	List network security groups. To check use command: 'az network nsg list'"
}
variable "custom_image" {
  description = "image name from which you want to deploy VMSS instance"
}
variable "customimage_resource_group" {
  description = "custom image resource group name"
}
variable "vmss_nic" {
  description = "nic name"
}
variable "vmss_name" {
  description = "name of the VMSS creating"
}

variable "computer_prefix" {
  description = "prefix for computer"
}

variable "proximity_group_name" {
  description = "proximity-group-name where you want to locate all your resources"
}

variable "sku" {
  description = "To check the size of the resources that will be created. To check use command: 'az vm list-sizes --location <location>' to obtain list"
}
variable "extra_disk" {
  description = "extra disk for vmss we can take 10 gb"
}

variable "os_storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values include Standard_LRS, StandardSSD_LRS, StandardSSD_ZRS, Premium_LRS and Premium_ZRS"
}


