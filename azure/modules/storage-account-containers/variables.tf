variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location of the Resource group"
}

variable "storage_account_name" {
  description = ""
}

variable "storage_account_tier" {
  description = ""
}

variable "storage_account_name_replication_type" {
  description = ""
}

variable "container_requied" {
  description = "count for creating the container"
  type = bool
  
}

variable "containers_name" {
  description =  "containers_name of storage"
  type =  string
}

variable "container_access_type" {
  description = "container_access_type "
  type = string
}
// variable "containers" {
//     type = map(object({
//         containers_name        = string
//         container_access_type  = string
//       }))
//     }
