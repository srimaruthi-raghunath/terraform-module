variable "subscription_id" {
    description = "Subscription ID"
    type = string
    default = "7c03dd83-6b95-43b1-9f53-23dfd07e8803"
}

variable "organization" {
    description = "Organization name"
    type = string
    default = "SW4ZF"
}

variable "project_id" {
    description = "project_id"
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

variable "service_connection_name" {
    description = "service_connection_name"
    type = string
}

variable "scaleset_name" {
    description = "scaleset_name"
    type = string
}

# API maxCapacity
variable "max_number_of_vms" {
    description = "Maximum number of nodes that will exist in the elastic pool"
    type = number
    default = 5
}

# API desiredIdle
variable "number_of_standby_agents" {
    description = "Number of agents to have ready waiting for jobs"
    type = number
    default = 1
}

# API recycleAfterEachUse
variable "automatically_teardown_vms" {
    description = "Discard node after each job completes"
    type = bool
    default = true
}

# API timeToLiveMinutes
variable "delay_in_minutes" {
    description = "The minimum time in minutes to keep idle agents alive"
    type = number
}

# API osType
variable "os_type" {
    description = "Operating system type of the nodes in the pool: 'windows' or 'linux'"
    type = string
}
