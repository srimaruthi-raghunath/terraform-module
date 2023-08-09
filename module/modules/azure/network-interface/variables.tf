variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]"
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}
variable "nic-name" {
  description = "The name of the network interface. Changing this forces a new resource to be created"
}

variable "ipname" {
  description = "User-defined name of the IP"
}

variable "subnetid" {
  description = "Reference to a subnet in which this NIC has been created. Required when private_ip_address_version is IPv4"
}
