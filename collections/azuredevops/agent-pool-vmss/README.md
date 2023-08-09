# agent-pool-vmss
The collection creates a VMSS Azure agent pool inside organization and in a specified project on Azure DevOps.

## Permissions

At least the following access rights (authorized access scopes) must be associated with this token:
- Agent Pools (Read & manage)
- User Profile (Read)
- Service Connections (Read & Query)

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

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent_pool_name"></a> [agent\_pool\_name](#input\_agent\_pool\_name) | agent\_group\_name | `string` | n/a | yes |
| <a name="input_delay_in_minutes"></a> [delay\_in\_minutes](#input\_delay\_in\_minutes) | The minimum time in minutes to keep idle agents alive | `number` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Operating system type of the nodes in the pool: 'windows' or 'linux' | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | project\_name | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | resource\_group\_name | `string` | n/a | yes |
| <a name="input_scaleset_name"></a> [scaleset\_name](#input\_scaleset\_name) | scaleset\_name | `string` | n/a | yes |
| <a name="input_service_connection_name"></a> [service\_connection\_name](#input\_service\_connection\_name) | service\_connection\_name | `string` | n/a | yes |
| <a name="input_automatically_teardown_vms"></a> [automatically\_teardown\_vms](#input\_automatically\_teardown\_vms) | Discard node after each job completes | `bool` | `true` | no |
| <a name="input_max_number_of_vms"></a> [max\_number\_of\_vms](#input\_max\_number\_of\_vms) | Maximum number of nodes that will exist in the elastic pool | `number` | `5` | no |
| <a name="input_number_of_standby_agents"></a> [number\_of\_standby\_agents](#input\_number\_of\_standby\_agents) | Number of agents to have ready waiting for jobs | `number` | `1` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Organization name | `string` | `"SW4ZF"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Subscription ID | `string` | `"7c03dd83-6b95-43b1-9f53-23dfd07e8803"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->