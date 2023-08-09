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

 variable "lbname" {
  description = "lbname"
 }
 variable "backendpoolname" {
   description = "backend pool name "
 }

//  variable "cusimage" {
//     description = "custom image name"
//  }

//  variable "custom_resource_group_name" {
//     description = " customm Resource group name"
//  }
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
