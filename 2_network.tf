# Virtual Network
resource "azurerm_virtual_network" "weight_app_network" {
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  name                = "${var.prefix}_network"
  resource_group_name = azurerm_resource_group.weight-app.name
}

# Private subnet
resource "azurerm_subnet" "backend_subnet" {
  address_prefixes     = ["10.0.0.0/28"] 
  name                 = "backendSubnet"
  resource_group_name  = azurerm_resource_group.weight-app.name
  virtual_network_name = azurerm_virtual_network.weight_app_network.name

  depends_on = [azurerm_resource_group.weight-app]
}

# Frontend subnet
resource "azurerm_subnet" "frontend_subnet" {
  address_prefixes     = ["10.0.10.0/28"]
  name                 = "frontendSubnet"
  resource_group_name  = azurerm_resource_group.weight-app.name
  virtual_network_name = azurerm_virtual_network.weight_app_network.name

  depends_on =  [azurerm_resource_group.weight-app]
}

# Sysadmin worker
resource "azurerm_subnet" "sysadmin_subnet" {
  address_prefixes     = ["10.0.20.0/28"] 
  name                 = "sysadminSubnet"
  resource_group_name  = azurerm_resource_group.weight-app.name
  virtual_network_name = azurerm_virtual_network.weight_app_network.name

  depends_on =  [azurerm_resource_group.weight-app]
}

# Provide each macine with a nic
resource "azurerm_network_interface" "frontendNics" {
  count               = var.machines
# the following name needs to be dynamic:
  name                = "frontserver${count.index}"
  location            = var.location
  resource_group_name  = azurerm_resource_group.weight-app.name
#  virtual_network_name = azurerm_virtual_network.weight-app_network.name

  ip_configuration {
## {{dynamic variable connection}}

    name                          = azurerm_public_ip.frontendIP.id
    subnet_id                     = azurerm_subnet.frontend_subnet.id
    private_ip_address_allocation = "Dynamic"

  }

  depends_on = [
    azurerm_resource_group.weight-app,
    azurerm_subnet.frontend_subnet
  ]

}

# Availability Set
resource "azurerm_availability_set" "weigght_app_avs" {
  name                         = "frontend_avs"
  location                     = var.location
  resource_group_name          = azurerm_resource_group.weight-app.name
  platform_fault_domain_count  = var.machines
  platform_update_domain_count = var.machines
  managed                      = true

  depends_on          = [azurerm_resource_group.weight-app]

}