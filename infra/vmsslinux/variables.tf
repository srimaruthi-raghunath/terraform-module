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
//  variable "nic-name" {
//     description = "nic-name" 
// }

// variable "ipname" {
//   description = "ipname"  
// }

 variable "vmssname" {
  description = "vmssname"
    
 }
variable "vmuser" {
  description = "username"
  
}
 variable "password" {
   description = "password"
 }
 variable "osversion"{
   description = "osversion ex:16.04-LTS"
}

variable "imgtype" {
  description = "image type ex:Standard_DS1_v2"
}