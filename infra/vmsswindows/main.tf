module "azurerm_resource_group" {
source = "../../azure/modules/resourcegroup"
resource_group_name = var.resource_group_name
}


module "azurerm_virtual_vnetsubet" {
  source = "../../azure/modules/vnetsubnet"
  vnetname = var.vnetname
  subnetname = var.subnetname
  resource_group_name = module.azurerm_resource_group.name
}

module "azurerm_network_security_group" {
  source = "../../azure/modules/nsg"
  nsgname = var.nsgname
  resource_group_name = module.azurerm_resource_group.name
}



module "vmss" {
  source = "../../azure/modules/windowsvmss"
  cusimage = var.cusimage
  custom_resource_group_name = var.custom_resource_group_name
  resource_group_name = module.azurerm_resource_group.name
  location  = module.azurerm_resource_group.location
  vmssname = var.vmssname
  vmuser =  var.vmuser
  password = var.password
  subnetid = module.azurerm_virtual_vnetsubet.subnetid
  #backendpoolid = module.azurerm_load_balancer.backedid
 
}

