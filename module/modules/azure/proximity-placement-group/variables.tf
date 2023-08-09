variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]"
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "proximity_group_name" {
  description = " Specifies the name of the availability set. Changing this forces a new resource to be created."
}