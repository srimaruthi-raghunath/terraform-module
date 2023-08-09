data "external" "vmss-pool" {
  program = ["python3.8", "${path.module}/vmss_pool.py"]
  query = {
    organization = var.organization
    project_name = var.project_name
    resource_group_name = var.resource_group_name
    agent_pool_name = var.agent_pool_name
    max_no_of_vms = var.max_no_of_vms
    no_of_standby_agents = var.no_of_standby_agents
    automatically_teardown_vms = var.automatically_teardown_vms
    delay_in_minutes = var.delay_in_minutes
    service_connection_name = var.service_connection_name
    subscription_id = var.subscription_id
    scaleset_name = var.scaleset_name
    os_type = var.os_type
  }
}