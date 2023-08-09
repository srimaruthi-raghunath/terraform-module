variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
    description = "location"
}
variable "lbname" {
    description = "load balancer name"
    
}

variable "sku" {
    description = "sku type basic or standard"
    default = "Basic"
}



variable "backendpoolname" {
    description = "backendpoolname"
    
}

variable "subnet_id" {
    description = "subnet id "
}