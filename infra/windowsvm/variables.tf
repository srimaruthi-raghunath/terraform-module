variable "resource_group_name" {
  description = "Resource group name"
}


variable "vnetname" {
  description = "vnetname"
}

 variable "subnetname" {
   description = "subnet name"
 }


 variable "nsgname" {
   description = "nsgname"
 }

variable "nic-name" {
    description = "nic-name" 
}

variable "ipname" {
  description = "ipname"  
}

variable "vmname" {
   description = "vmname"
}

variable "vmusername" {
  description = "vmusername"
}

variable "vmpassword" {
  description = "vmpassword"
 
}
variable "imgsize" {
  description = "imgsize"
}
variable "osversion" {
  description = "osversion"
}
variable "publisher" {
  description = "publisher widnows MicrosoftWindowsServer"
}

variable "offer" {
  description =  "windows os offer ex: WindowsServer"
}