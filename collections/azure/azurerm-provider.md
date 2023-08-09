### Azurerm provider ([Terraform documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs))
The `azurerm` Terraform provider authenticated as a Service Principal with Client Certificate depends on following parameters:  
- Subscription ID - definied as `ARM_SUBSCRIPTION_ID` environment variable
- Tenant ID - definied as `ARM_TENANT_ID` environment variable
- Client ID - definied as `ARM_CLIENT_ID` environment variable
- Client secret - definied as `ARM_CLIENT_SECRET` environment variable


**Usage in GitOps Framework**

GitOps Framework requires secrets that are stored in customer Resource Group KeyVault.
Make sure following secrets exists in your Resource Group KeyVault:
- `GITOPS_SUBSCRIPTION_ID` environment variable provided from GitOps KeyVault (`subscription-id` secret)
- `GITOPS_TENANT_ID` environment variable provided from GitOps KeyVault (`tenant-id` secret)
- `GITOPS_SP_CLIENT_ID` environment variable provided from GitOps KeyVault (`gitops-sp-client-id` secret)
- `GITOPS_SP_CLIENT_SECRET`environment variable provided from GitOps KeyVault (`gitops-sp-client-secret` secret)
