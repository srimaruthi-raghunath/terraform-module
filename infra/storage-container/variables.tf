variable "resource_group_name" {
  description = "Resource group name"
}


variable "storage_account_name" {
  description = "accout number"
}

variable "storage_account_tier" {
  description = "example Standard or  Premium"
}

variable "storage_account_name_replication_type" {
  description = "example LRS, GRS, RAGRS, ZRS, GZRS"
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
  description = "container_access_type hot or cold"
  type = string
}
// variable "containers" {
//     type = map(object({
//         containers_name        = string # container name
//         container_access_type  = string # Hot and Cool
//       }))
   
//     }
