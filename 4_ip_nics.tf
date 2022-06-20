# Main public IP
resource "azurerm_public_ip" "frontend_public_ip" {
  name                = "weight_app_public_ip"
  resource_group_name  = azurerm_resource_group.weight-app.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"

  idle_timeout_in_minutes = 30

}

# Public network interface cards
resource "azurerm_network_interface" "network_interface_app" {
  count               = var.machines
#   name                = "${var.lb_backend_ap_ip_configuration_name}-${count.index + 1}"
  name                = "NC${count.index}"
  resource_group_name  = azurerm_resource_group.weight-app.name
  location            = var.location

  ip_configuration {
    name                          = var.lb_backend_ap_ip_configuration_name
    subnet_id                     = azurerm_subnet.app_subnet.id
    private_ip_address_allocation = "Dynamic"

  }

# Make sure resource group and subnet exists prior to connection
  depends_on = [
    azurerm_resource_group.weight-app,
    azurerm_subnet.frontend_subnet
  ]

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

