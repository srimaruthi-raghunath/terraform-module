# vmss-linux
The collection creates a Azure VMSS in a specified resource group on Azure Portal.  
For usage of this VMSS as Agent Pool, parameters below must be configured:  
- `overprovision` as `false`
- `instances` to `0`

<!-- BEGIN_TF_DOCS -->
## Providers

No providers.
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

## Example
```
module "vmss" {
  source                              = "git::https://SW4ZF@dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//modules/azure/vmss-linux?ref=main"
  resource_group_name                 = "AZP-112-DAFORA-RG"
  vnetname                            = "AZO-VNET-001"
  subnetname                          = "subnet-westeurope"
  nsgname                             = "AZP-112-DAFORA-NSG"
  nic-name                            = "AZP-112-DAFORA-VMSS-01-NIC"
  ipname                              = "AZP-112-DAFORA-VMSS-01-IP"
  keyvault_name                       = "AZP-112-DAFORA-KV"
  keyvault_resource_group_name        = "AZP-112-DAFORA-RG"
  keyvault_admin_password_secret_name = "admin-password"
  custom_image                        = "vm-linux-sf-image-20221230"
  customimage_resource_group          = "AZP-112-DAFORA-RG"
  proximity_group_name                = "AZP-112-DAFORA-VMSS-PPG"
  vmss_name                           = "AZP-112-DAFORA-VMSS-01"
  computer_prefix                     = "AZP-112-DAFORA-VMSS-VM"
  admin_username                      = "admin"
  os_storage_account_type             = "Standard_LRS"
  sku                                 = "20.04-LTS"
  extra_disk                          = 20
  overprovision                       = false
  instances                           = 3
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created | `string` | n/a | yes |
| <a name="input_computer_prefix"></a> [computer\_prefix](#input\_computer\_prefix) | name of the instance created | `string` | n/a | yes |
| <a name="input_custom_image"></a> [custom\_image](#input\_custom\_image) | image name from which you want to deploy VMSS instance | `string` | n/a | yes |
| <a name="input_customimage_resource_group"></a> [customimage\_resource\_group](#input\_customimage\_resource\_group) | custom image resource group name | `string` | n/a | yes |
| <a name="input_extra_disk"></a> [extra\_disk](#input\_extra\_disk) | extra disk for vmss we can take 10 gb | `number` | n/a | yes |
| <a name="input_ipname"></a> [ipname](#input\_ipname) | User-defined name of the IP | `string` | n/a | yes |
| <a name="input_keyvault_admin_password_secret_name"></a> [keyvault\_admin\_password\_secret\_name](#input\_keyvault\_admin\_password\_secret\_name) | The key name of secret from Key Vault where user password is stored. | `string` | n/a | yes |
| <a name="input_keyvault_name"></a> [keyvault\_name](#input\_keyvault\_name) | The name of the Key Vault which contains secrets. | `string` | n/a | yes |
| <a name="input_keyvault_resource_group_name"></a> [keyvault\_resource\_group\_name](#input\_keyvault\_resource\_group\_name) | The name of the resource group where Key Vault is located. | `string` | n/a | yes |
| <a name="input_nic-name"></a> [nic-name](#input\_nic-name) | The name of the network interface. Changing this forces a new resource to be created | `string` | n/a | yes |
| <a name="input_nsgname"></a> [nsgname](#input\_nsgname) | Specifies the Name of the Network Security Group. | `string` | n/a | yes |
| <a name="input_os_storage_account_type"></a> [os\_storage\_account\_type](#input\_os\_storage\_account\_type) | The Type of Storage Account which should back this the Internal OS Disk. Possible values include Standard\_LRS, StandardSSD\_LRS, StandardSSD\_ZRS, Premium\_LRS and Premium\_ZRS | `string` | n/a | yes |
| <a name="input_proximity_group_name"></a> [proximity\_group\_name](#input\_proximity\_group\_name) | Specifies the name of the availability set. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the resources will be created. To check, use command: 'az group list [--tag]' | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | To check the size of the resources that will be created. To check use command: 'az vm list-sizes --location <location>' to obtain list | `string` | n/a | yes |
| <a name="input_subnetname"></a> [subnetname](#input\_subnetname) | Specifies the name of the Subnet. | `string` | n/a | yes |
| <a name="input_vmss_name"></a> [vmss\_name](#input\_vmss\_name) | name of the VMSS creating | `string` | n/a | yes |
| <a name="input_vnetname"></a> [vnetname](#input\_vnetname) | Specifies the name of the Virtual Network. | `string` | n/a | yes |
| <a name="input_instances"></a> [instances](#input\_instances) | The number of Virtual Machines in the Scale Set. | `number` | `1` | no |
| <a name="input_overprovision"></a> [overprovision](#input\_overprovision) | Parameter responsible for allowing scale set to spins up more VMs than is asked for. After it deletes the extra VMs once the requested number of VMs are succesfully provisioned. More details: https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/virtual-machine-scale-sets-design-overview#overprovisioning | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->