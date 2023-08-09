
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


variable "vmuser" {
  description = "username"
}

variable "password" {
  description = "password"
}

variable "osversion" {
  description = "osversion ex:16.04-LTS"
}

variable "imgtype" {
  description = "image type ex:Standard_DS1_v2"
}
