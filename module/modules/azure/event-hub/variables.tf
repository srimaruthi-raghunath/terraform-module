variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location of the Resource group"
}

variable "event_hub_namespace" {
  description = "(Required) Specifies the name of the EventHub Namespace. Changing this forces a new resource to be created."
}

variable "event_hub_namespace_sku" {
  description = "(Required) Defines which tier to use. Valid options are Basic and Standard."
  default     = "Standard"
}

variable "event_hub_namespace_capacity" {
  description = "(Optional) Specifies the Capacity / Throughput Units for a Standard SKU namespace. Default capacity has a maximum of 20, but can be increased in blocks of 20 on a committed purchase basis."
  default     = 1
}

variable "event_hub_name" {
  description = "(Required) Specifies the name of the EventHub resource. Changing this forces a new resource to be created."
}

variable "event_hub_partition_count" {
  description = "(Required) Specifies the current number of shards on the Event Hub. Changing this forces a new resource to be created."
}

variable "event_hub_message_retention" {
  description = "(Required) Specifies the number of days to retain the events for this Event Hub."
  default     = 1
}
