variable "project_name" {
  description = "The name of the referenced Azure DevOps project where pool will be created"
  type        = string
}

variable "pool_name" {
  description = "The name of the agent pool"
  type        = string
}
