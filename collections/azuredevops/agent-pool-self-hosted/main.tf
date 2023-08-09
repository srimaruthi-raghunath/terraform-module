data "azuredevops_project" "project" {
  name = var.project_name
}

resource "azuredevops_agent_pool" "pool" {
  name      = var.pool_name
  pool_type = "automation"
}

resource "azuredevops_agent_queue" "project_pool" {
  project_id    = data.azuredevops_project.project.id
  agent_pool_id = azuredevops_agent_pool.pool.id
}
