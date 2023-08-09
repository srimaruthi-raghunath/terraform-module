variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]'"
}

variable "shared_image_version" {
  description = "The name of the Image Version v1.0.0"
}

variable "image_name" {
  description = "The name of the Shared Image in which this Version exists."
}

variable "gallery_name" {
  descdescription = "The name of the Shared Image Gallery in which the Shared Image exists."
}