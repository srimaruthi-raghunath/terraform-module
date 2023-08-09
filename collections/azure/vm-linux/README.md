---
hide:
  - tags
---

# Azure linux VM

This Terraform module deploys Virtual Machine on Azure environment.

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Example

```yaml
module "azure_linux_vm" {
  source                   = "git::https://dev.azure.com/SW4ZF/AZP-001_SW4ZF_ToolsDevOps/_git/terraform-modules//azure_linux_vm?ref=stable/v1"
  computer_name            = "AZP-112-Linux-Example"
  resource_group_location  = "West Europe"
  resource_group_name      = "AZP-112-EXAMPLE-RG"
  network_interface_id     = "ExampleNIC"
  size                     = "Standard_A1_v2"
  admin_username           = "ExampleAdmin"
  admin_password           = "ExAmPlE-pAsSwOrD"
  disk_size_gb             = "50"
  publisher                = "Canonical"
  offer                    = "UbuntuServer"
  sku                      = "18.04-LTS"
  boot_storage_account_uri = ""
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Password for admin user | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Username of admin user | `string` | n/a | yes |
| <a name="input_boot_storage_account_uri"></a> [boot\_storage\_account\_uri](#input\_boot\_storage\_account\_uri) | Uri of Boot Storage Account | `string` | n/a | yes |
| <a name="input_computer_name"></a> [computer\_name](#input\_computer\_name) | Host name. | `string` | n/a | yes |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | Disk size in GB. | `number` | n/a | yes |
| <a name="input_network_interface_id"></a> [network\_interface\_id](#input\_network\_interface\_id) | Identificator of Network Interface | `string` | n/a | yes |
| <a name="input_offer"></a> [offer](#input\_offer) | Offer's name, example: UbuntuServer. To check use command: 'az vm image list' to obtain list. | `string` | n/a | yes |
| <a name="input_publisher"></a> [publisher](#input\_publisher) | Name of VM image publisher, example: Canonical. To check use command: 'az vm image list' to obtain list | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | (Optional) The location in which the resources will be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the resources will be created. | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | To check the size of the resources that will be created. To check use command: 'az vm list-sizes --location <location>' to obtain list | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Stock Keeping Unit, example: 22.04-LTS. To check use command: 'az vm image list' to obtain list | `string` | n/a | yes |
<!-- END_TF_DOCS -->