variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
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

variable "vmname" {
  description = "linux vm name"
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created"
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
