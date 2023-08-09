variable "vmname" {
  description = "linux vm name"
}
variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
    description = "location"
}

variable "nicid" {
    description = "nic id from network interface"
}

variable "username" {
   description = "username"
}

variable "password" {
  description = "password"
}

variable "imgsize" {
   description = "imgsize "
}

variable "osversion"{
   description = "osversion "

}

// variable "disk_size_gb" {
//   description = "os disk size"
//   type        = number 
//   default = 20
// }

variable "publisher" {
  description = "publisher widnows MicrosoftWindowsServer"
}

variable "offer" {
  description =  "windows os offer ex: WindowsServer"
}