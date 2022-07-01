# Load blanacer
resource "azurerm_lb" "azurerm_lb" {
  name                = "loadBalancer"
  resource_group_name  = var.group.name
  location            = var.location

# ip_configuration
  frontend_ip_configuration {
    name                 = "mip"
    public_ip_address_id = azurerm_public_ip.ip.id
  }
  sku = "Standard"
}
 # Lb address_pool
 resource "azurerm_lb_backend_address_pool" "lb_pool" {
  loadbalancer_id = azurerm_lb.azurerm_lb.id
  name            = "addressPool"
  depends_on = [azurerm_lb.azurerm_lb]

}
# lb_probe
resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id     = azurerm_lb.azurerm_lb.id
  name                = "lb_probe"
  port                = 8080
}

# lb_outbound_rule
resource "azurerm_lb_outbound_rule" "outbound" {
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_pool.id
  loadbalancer_id         = azurerm_lb.azurerm_lb.id
  name                    = "Any"
  protocol                = "All"

  frontend_ip_configuration {
    name = "mip"
  }

  depends_on = [azurerm_lb.azurerm_lb]

}

