# Sysadmin worker
resource "azurerm_subnet" "sysadmin_subnet" {
  address_prefixes     = ["10.0.30.0/26"] 
  name                 = "sysadminSubnet"
  resource_group_name  = azurerm_resource_group.weight-app.name
  virtual_network_name = azurerm_virtual_network.weight_app_network.name

  depends_on =  [azurerm_resource_group.weight-app]
}