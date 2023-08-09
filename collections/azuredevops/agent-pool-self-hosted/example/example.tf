module "azure_agent_pool" {
  source       = "git::https://dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//collections/azuredevops/agent-pool-self-hosted"
  project_name = "project_name"
  pool_name    = "pool_name"
}
