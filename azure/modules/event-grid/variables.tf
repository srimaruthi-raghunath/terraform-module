variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location of the Resource group"
}

variable "event_grid_topic_name" {
  description = "(Required) Specifies the name of the EventGrid Topic resource. Changing this forces a new resource to be created."
}