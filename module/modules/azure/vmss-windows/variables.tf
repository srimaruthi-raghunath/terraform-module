variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]'"
}

variable "location" {
  description = "location of existing resoruce group location"

}

variable "source_image_id" {
  description = "source_image_id of custom image"

}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created"
}

variable "admin_password" {
  description = "The password of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created"
}


variable "vmss_name" {
  description = "name of the VMSS creating"
}

variable "subnet_id" {
  description = "subnet id form virtual network"
}
variable "computer_prefix" {
  description = "prefix for computer ex: first 2 letters of the project to refer and assign to computername under vmss"
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

variable "proximity_placement_group_id" {
  description = "proximity_placement_group_id"

}

