# Main public IP
resource "azurerm_public_ip" "ip" {
  name                = "ip"
  resource_group_name  = azurerm_resource_group.weight-app.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"

  idle_timeout_in_minutes = 30

}


# Connect front end nics to backend pool ip and machine must match
resource "azurerm_network_interface_backend_address_pool_association" "fe_nics_connection" {
  count                   = "${var.TF_VAR_machines}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_pool.id
  ip_configuration_name   = "${var.pool_name}-${count.index}"
  network_interface_id    = azurerm_network_interface.nics[count.index].id
  depends_on              = [  azurerm_lb.azurerm_lb ]
}




