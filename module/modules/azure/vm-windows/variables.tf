variable "vmname" {
  description = "windows vm name"
}
variable "myOsDisk" {
  description = "name of the disk"
}
variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]'"
}

variable "location" {
  description = "location of existing resoruce group location"

}

variable "nicid" {
  description = "nic id from network interface"
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created"
}

variable "admin_password" {
  description = "The password of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created"
}

variable "imgsize" {
  description = "The SKU which should be used for this Virtual Machine, such as ex: Standard_F2."
}
variable "os_storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values include Standard_LRS, StandardSSD_LRS, StandardSSD_ZRS, Premium_LRS and Premium_ZRS"
}

variable "publisher" {
  description = "Specifies the publisher of the image used to create the virtual machines. ex: Canonical"
}
variable "offer" {
  description = "Specifies the offer of the image used to create the virtual machines ex: UbuntuServer"

}
variable "osversion" {
  description = "Specifies the SKU of the image used to create the virtual machines.ex: 16.04-LTS"
}



