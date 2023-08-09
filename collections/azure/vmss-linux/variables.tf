variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]'"
  type        = string
}

variable "vnetname" {
  description = "Specifies the name of the Virtual Network."
  type        = string
}

variable "subnetname" {
  description = "Specifies the name of the Subnet."
  type        = string
}

variable "nsgname" {
  description = "Specifies the Name of the Network Security Group."
  type        = string
}

variable "nic-name" {
  description = "The name of the network interface. Changing this forces a new resource to be created"
  type        = string
}

variable "ipname" {
  description = "User-defined name of the IP"
  type        = string
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
  type        = string
}
variable "customimage_resource_group" {
  description = "custom image resource group name"
  type        = string
}

variable "proximity_group_name" {
  description = " Specifies the name of the availability set. Changing this forces a new resource to be created."
  type        = string
}

variable "vmss_name" {
  description = "name of the VMSS creating"
  type        = string
}

variable "computer_prefix" {
  description = "name of the instance created"
  type        = string
}

variable "sku" {
  description = "To check the size of the resources that will be created. To check use command: 'az vm list-sizes --location <location>' to obtain list"
  type        = string
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created"
  type        = string
}

variable "os_storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values include Standard_LRS, StandardSSD_LRS, StandardSSD_ZRS, Premium_LRS and Premium_ZRS"
  type        = string
}

variable "extra_disk" {
  description = "extra disk for vmss we can take 10 gb"
  type        = number
}

variable "overprovision" {
  description = "Parameter responsible for allowing scale set to spins up more VMs than is asked for. After it deletes the extra VMs once the requested number of VMs are succesfully provisioned. More details: https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/virtual-machine-scale-sets-design-overview#overprovisioning"
  type        = bool
  default     = true
}

variable "instances" {
  description = "The number of Virtual Machines instances in the Scale Set."
  type        = number
  default     = 1
}