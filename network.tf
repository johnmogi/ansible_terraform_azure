resource "azurerm_virtual_network" "weight_app_network" {
  name="${var.name}_${terraform.workspace}_network"
  location            = "${azurerm_resource_group.weight-app.location}"
  resource_group_name = "${azurerm_resource_group.weight-app.name}"
  address_space       = ["10.0.0.0/16"]
    tags = {
    Environment = "weightapp - ${terraform.workspace}"
  }
}

resource "azurerm_subnet" "frontend_subnet" {
  name                 = "frontendSubnet"
  resource_group_name = "${azurerm_resource_group.weight-app.name}"
  virtual_network_name = azurerm_virtual_network.weight_app_network.name
  address_prefixes = ["10.0.20.0/26"]
}

resource "azurerm_subnet" "backend_subnet" {
  name                 = "backend_subnet"
  resource_group_name = "${azurerm_resource_group.weight-app.name}"
  virtual_network_name = azurerm_virtual_network.weight_app_network.name
  address_prefixes     = ["10.0.10.0/26"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}