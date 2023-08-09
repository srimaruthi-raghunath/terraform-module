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


#module "azurerm_subnet_network_security_group_association" {
 # source = "../../azure/network-security-association"
#  subnetid = module.azurerm_virtual_vnetsubet.subnetid
#  nsgid = module.azurerm_network_security_group.id
#}

module "azurerm_load_balancer" {
  source = "../../azure/modules/Load-balancer"
   lbname = var.lbname
   subnet_id = module.azurerm_virtual_vnetsubet.subnetid
   resource_group_name =  module.azurerm_resource_group.name
   location  = module.azurerm_resource_group.location
   backendpoolname =  var.backendpoolname
  }

module "vmss" {
  source = "../../azure/modules/vmss-lb"
  resource_group_name = module.azurerm_resource_group.name
  location  = module.azurerm_resource_group.location
  vmssname = var.vmssname
  vmuser =  var.vmuser
  password = var.password
  subnetid = module.azurerm_virtual_vnetsubet.subnetid
  osversion =  var.osversion
  imgtype = var.imgtype
  backendpoolid =  module.azurerm_load_balancer.backedid
}