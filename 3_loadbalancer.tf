# Load blanacer
resource "azurerm_lb" "azurerm_lb" {
  name                = "loadBalancer"
  resource_group_name  = azurerm_resource_group.weight-app.name
  location            = var.location

# Ip
  frontend_ip_configuration {
    name                 = "mip"
    public_ip_address_id = azurerm_public_ip.ip.id
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

