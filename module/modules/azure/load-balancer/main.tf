resource "azurerm_lb" "this" {
  name                = var.lbname
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  sku_tier            = "Regional"
  frontend_ip_configuration {
    name                          = "vmssfrontend-ip"
    private_ip_address_version    = "IPv4"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = var.backendpoolname

}


resource "azurerm_lb_probe" "this" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.this.id
  name                = "probeA"
  port                = 80
  protocol            = "Tcp"

}


resource "azurerm_lb_rule" "this" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.this.id
  name                           = "RuleA"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "vmssfrontend-ip"
  probe_id                       = azurerm_lb_probe.this.id
  #backend_address_pool_id        = azurerm_lb_backend_address_pool.this.id
}
