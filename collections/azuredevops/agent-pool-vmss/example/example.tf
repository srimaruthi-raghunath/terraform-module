module "agent-pool-vmss" {
  source = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//collections/azuredevops/agent-pool-vmss?ref=main"

  project_name                    = "AZP-112_DAFORA"
  resource_group_name             = "AZP-112-DAFORA-RG"

  agent_pool_name                 = "my-vmss-pool-name"
  scaleset_name                   = "my-vmss-name"
  service_connection_name         = "AZP-112-RG_DAFORA_SC"

  max_number_of_vms               = 5
  number_of_standby_agents        = 1
  automatically_teardown_vms      = true
  delay_in_minutes                = 5
  os_type                         = "linux"
}

