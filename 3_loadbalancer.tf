# Load blanacer
resource "azurerm_lb" "azurerm_lb" {
  name                = "loadBalancer"
  resource_group_name  = azurerm_resource_group.weight-app.name
  location            = var.location

# Ip
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.frontend_public_ip.id
  }
  sku = "Standard"
}
 # Lb pool
 resource "azurerm_lb_backend_address_pool" "lb_pool" {
  loadbalancer_id = azurerm_lb.azurerm_lb.id
  name            = "addressPool"

  depends_on = [azurerm_lb.azurerm_lb]

}
# resource "azurerm_lb_probe" "lb_probe" {
#   loadbalancer_id     = azurerm_lb.azurerm_lb.id
#   name                = "lb_probe"
#   port                = 8080
# }

# Connect front end nics to backend pool
resource "azurerm_network_interface_backend_address_pool_association" "fe_nics_connection" {
  count                   = var.machines
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_pool.id
  ip_configuration_name   = var.lb_backend_ap_ip_configuration_name
  network_interface_id    = azurerm_network_interface.frontend_nics.nic_ids[count.index].id

  depends_on              = [ azurerm_lb_backend_address_pool.backend_add_pool, azurerm_lb.azurerm_lb ]
}