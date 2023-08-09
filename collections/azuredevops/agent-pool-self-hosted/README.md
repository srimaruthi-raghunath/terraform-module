# agent-pool-self-hosted
The collection creates a self-hosted Azure agent pool in a specified project on Azure DevOps.

## Permissions

At least the following access rights (authorized access scopes) must be associated with this token:
- Agent Pools (Read & manage)
- User Profile (Read)

Additionally, the service account (the owner of the token) must be granted the following permissions by Support Ticket:
- `Administrator permissions for Agent pools` at the project and organization levels

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 0.3.0 |
### AzureDevOps provider ([Terraform documentation](https://developer.hashicorp.com/terraform/language/modules/develop/providers))
The `azuredevops` Terraform provider depends on:  
- Personal Access Token (PAT) -  defined as `AZDO_PERSONAL_ACCESS_TOKEN` environment variable  
- Azure DevOps organization url - defined as `AZDO_ORG_SERVICE_URL` environment variable

**Usage in GitOps Framework**

In GitOps Framework:  
-  `AZDO_PERSONAL_ACCESS_TOKEN` environment variable is provided from GitOps KeyVault (`gitops-azuredevops-pat` secret)  
    > Make sure your existing token has the correct permissions, if not, use the Edit option on the PAT token.
- `AZDO_ORG_SERVICE_URL` is hardcoded and set as url: `https://dev.azure.com/SW4ZF`


**Usage outside GitOps Framework**

In case of usage colection outside the GitOps Framework:  
- environment variables: `AZDO_PERSONAL_ACCESS_TOKEN` and `AZDO_ORG_SERVICE_URL` must be settled  

    or
- block `provider` must be define in root terraform configuration (file `providers.tf`) according terrafrom documentation: [Providers Within Modules](https://developer.hashicorp.com/terraform/language/modules/develop/providers)  

    Example of file `providers.tf`:
    ```
    terraform {
      required_providers {
        azuredevops = {
          source  = "microsoft/azuredevops"
          version = "0.3.0"
        }
      }
    }
    
    provider "azuredevops" {
      org_service_url = "https://dev.azure.com/SW4ZF"
      alias  = "child"
    }
    ```
    
    Additional line in `main.tf` file is required inside `module` block:
    ``` 
    module "xxxxx"{
      .....
      providers                       = { azuredevops = azuredevops.child }
      .....
    }
    
    ```
    
    Additional technical information: [Legacy Shared Modules with Provider Configurations](https://developer.hashicorp.com/terraform/language/modules/develop/providers#legacy-shared-modules-with-provider-configurations)

## Example
```
module "azure_agent_pool" {
  source       = "git::https://dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//collections/azuredevops/agent-pool-self-hosted"
  project_name = "project_name"
  pool_name    = "pool_name"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pool_name"></a> [pool\_name](#input\_pool\_name) | The name of the agent pool | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the referenced Azure DevOps project where pool will be created | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->