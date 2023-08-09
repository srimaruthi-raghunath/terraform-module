variable "project_name" {
    description = "project_name"
    type = string  
}
variable "organization" {
    description = "organization"
    type = string  
}

variable "resource_group_name" {
    description = "resource_group_name"
    type = string
}

variable "agent_pool_name" {
    description = "agent_group_name"
    type = string 
}

variable "max_no_of_vms" {
    description = "agent_group_name"
    type = string
}

variable "no_of_standby_agents" {
    description = "no_of_standby_agents"
    type = string
}

variable "automatically_teardown_vms" {
    description = "true or false"
    type = string

}

variable "delay_in_minutes" {
    description = "delay_in_minutes"
    type = string
}

variable "service_connection_name" {
    description = "service_connection_name"
    type = string
}

variable "subscription_id" {
    description = "subscription_id"
    type = string
}

variable "scaleset_name" {
    description = "scaleset_name"
    type = string
}

variable "os_type" {
    description = "os_type"
    type = string
}
