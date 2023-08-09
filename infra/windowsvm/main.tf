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

module "azurerm_network_interface" {
source = "../../azure/modules/nic"
resource_group_name = module.azurerm_resource_group.name
location =  module.azurerm_resource_group.location
nic-name  = var.nic-name
ipname = var.ipname
subnetid =  module.azurerm_virtual_vnetsubet.subnetid
}

module "azurerm_network_interface_security_group_association" {
  source = "../../azure/modules/network-security-association"
  nicid  = module.azurerm_network_interface.id
  nsgid = module.azurerm_network_security_group.id
}

module "azurerm_windows_virtual_machine" {
source = "../../azure/modules/windowsvm"
resource_group_name = module.azurerm_resource_group.name
location =  module.azurerm_resource_group.location
vmname  = var.vmname
nicid = [module.azurerm_network_interface.id]
username = var.vmusername 
password = var.vmpassword
imgsize = var.imgsize
osversion =  var.osversion
publisher  = var.publisher
offer =  var.offer
}


