resource "shell_script" "pool-vmss" {

    lifecycle_commands {
        create = "python3 ${path.module}/main.py create"
        read   = "python3 ${path.module}/main.py read"
        delete = "python3 ${path.module}/main.py delete"
        update = "python3 ${path.module}/main.py update"
    }

    environment = {
        SUBSCRIPTION_ID = var.subscription_id
        ORGANIZATION = var.organization
        PROJECT_ID = var.project_id

        SERVICE_CONNECTION_NAME = var.service_connection_name
        RESOURCE_GROUP_NAME = var.resource_group_name
        AGENT_POOL_NAME = var.agent_pool_name

        MAX_NUMBER_OF_VMS = var.max_number_of_vms
        NUMBER_OF_STANDBY_AGENTS = var.number_of_standby_agents
        AUTOMATICALLY_TEARDOWN_VMS = var.automatically_teardown_vms
        DELAY_IN_MINUTES = var.delay_in_minutes
        SCALESET_NAME = var.scaleset_name
        OS_TYPE = var.os_type
    }

    triggers = {
      when_value_changed_organization = var.organization
      when_value_changed_agent_pool_name = var.agent_pool_name
    }
}

output "elastic_pool" {
  value = shell_script.pool-vmss.output
  sensitive = false
}
