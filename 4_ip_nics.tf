# Main public IP
resource "azurerm_public_ip" "frontendIP" {
  name                = "public_ip"
  resource_group_name  = azurerm_resource_group.weight-app.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"

  idle_timeout_in_minutes = 30

}

# Public network interface cards
resource "azurerm_network_interface" "network_interface_app" {
  count               = var.machines
  name                = "NC${count.index}"
  resource_group_name  = azurerm_resource_group.weight-app.name
  location            = var.location



## dependency injection nics => azurerm_network_interface_application_gateway_backend_address_pool_association
  ip_configuration {
    name                          = "webapp_${count.index}"
    subnet_id                     = azurerm_subnet.frontend_subnet.id
    private_ip_address_allocation = "Dynamic"

  }

# Make sure resource group and subnet exists prior to connection
  depends_on = [
    azurerm_resource_group.weight-app,
    azurerm_subnet.frontend_subnet
  ]

}

# Connect front end nics to backend pool
resource "azurerm_network_interface_backend_address_pool_association" "fe_nics_connection" {
  count                   = var.machines
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_pool.id
  ip_configuration_name   = var.pool_name
  # network_interface_id    = [element(azurerm_network_interface.frontendNics[count.index].id, count.index)]
  network_interface_id    = azurerm_network_interface.frontendNics[count.index].id

  depends_on              = [ azurerm_virtual_machine.weight_app,  azurerm_lb.azurerm_lb ]
}

# # Sysadmin IP
# resource "azurerm_public_ip" "sysadmin_ip" {
#   name                = "weight_app_sysadmin_ip"
#   resource_group_name  = azurerm_resource_group.weight-app.name
#   location            = var.location
#   allocation_method   = "Dynamic"
#   idle_timeout_in_minutes = 30

#   depends_on = [azurerm_resource_group.weight-app]
# }

