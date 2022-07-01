# Virtual Network
resource "azurerm_virtual_network" "weight_app_network_sys" {
  address_space       = ["10.0.0.0/16"] 
  location            = var.location
  name                = "${var.prefix}_network"
  resource_group_name = azurerm_resource_group.weight-app.name
}

# sysadmin subnet
resource "azurerm_subnet" "sysadmin_subnet" {
  address_prefixes     = ["10.0.10.0/26"]
  name                 = "sysadminSubnet"
  resource_group_name  = azurerm_resource_group.weight-app.name
  virtual_network_name = azurerm_virtual_network.weight_app_network.name

  depends_on =  [azurerm_resource_group.weight-app]
}



# Provide each macine with a nic
resource "azurerm_network_interface" "nics" {
  count               = "${var.TF_VAR_machines}"

  name                = "${var.pool_name}-${count.index} +1"
  location            = var.location
  resource_group_name  = var.group.name
#  virtual_network_name = azurerm_virtual_network.weight-app_network.name

  ip_configuration {
## {{dynamic variable connection}}
    name                          = "${var.pool_name}-${count.index} +1"
    subnet_id                     = azurerm_subnet.sysadmin_subnet.id
    private_ip_address_allocation = "Dynamic"

  }

  depends_on = [
    azurerm_resource_group.weight-app-sysadmin,
    azurerm_subnet.sysadmin_subnet
  ]
}
