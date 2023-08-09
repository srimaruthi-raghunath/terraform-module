variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]'"
  type        = string
}

variable "location" {
  description = "location of existing resoruce group location"
  type        = string
}

variable "source_image_id" {
  description = "source_image_id of custom image"
  type        = string
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created"
  type        = string
}

variable "admin_password" {
  description = "The password of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created"
  type        = string
}

variable "vmss_name" {
  description = "name of the VMSS creating"
  type        = string
}

variable "subnet_id" {
  description = "subnet id form virtual network"
  type        = string
}
variable "computer_prefix" {
  description = "prefix for computer ex: first 2 letters of the project to refer and assign to computername under vmss"
  type        = string
}

variable "proximity_group_name" {
  description = "proximity-group-name where you want to locate all your resources"
  type        = string
}
variable "sku" {
  description = "To check the size of the resources that will be created. To check use command: 'az vm list-sizes --location <location>' to obtain list"
  type        = string
}
variable "extra_disk" {
  description = "extra disk for vmss we can take 10 gb"
  type        = number
}

variable "os_storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values include Standard_LRS, StandardSSD_LRS, StandardSSD_ZRS, Premium_LRS and Premium_ZRS"
  type        = string
}

variable "proximity_placement_group_id" {
  description = "proximity_placement_group_id"
  type        = string
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