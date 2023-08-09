data "azuredevops_project" "project" {
  name = var.project_name
}

module "agent-pool-vmss" {
  source = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azuredevops/pool-vmss?ref=main"

  subscription_id                 = var.subscription_id
  project_id                      = data.azuredevops_project.project.id
  resource_group_name             = var.resource_group_name

  agent_pool_name                 = var.agent_pool_name
  scaleset_name                   = var.scaleset_name
  service_connection_name         = var.service_connection_name

  max_number_of_vms               = var.max_number_of_vms
  number_of_standby_agents        = var.number_of_standby_agents
  automatically_teardown_vms      = var.automatically_teardown_vms
  delay_in_minutes                = var.delay_in_minutes
  os_type                         = var.os_type
}

resource "azuredevops_agent_queue" "project_pool" {
  project_id    = data.azuredevops_project.project.id
  agent_pool_id = module.agent-pool-vmss.elastic_pool["poolId"]
}
