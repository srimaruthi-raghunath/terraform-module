# custom image details
 variable "cusimage" {
   description = "custom image name"
 }

 variable "custom_resource_group_name" {
 description = " customm Resource group name"
 }

variable "resource_group_name" {
  description = "Resource group name"
}
variable "location" {
    description = "location"
}
variable "vmssname" {
    description = "vmss name"
  
}

variable "subnetid" {
    description = "subnet id form virtual network"
}

#variable "backendpoolid" {
#  description = "lb backendpool id" 
#}
variable "vmuser" {
  description = "username"
  
}

variable "password" {
  description = "password"
  
}

