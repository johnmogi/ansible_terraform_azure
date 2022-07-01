# network_security_group
resource "azurerm_network_security_group" "sysadmin_nsg" {
  name                = "sysadmin_NSG"
  location            = var.location
  resource_group_name  = var.group.name

  # SSH 
  security_rule {
    name                       = "SSH"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 22
    destination_address_prefix = "10.0.20.0/26"

    # sysadmin permission to ssh - SYSADMIN- 10.0.30.0/26
    source_address_prefix = "10.0.0.0/16"
  }

  # Allow HTTP on port 8080
  security_rule {
    name                       = "HTTP"
    priority                   = 800
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 8080
    source_address_prefix      = "*"
    destination_address_prefix = "10.0.20.0/26"
  }


  tags = {
    environment = "${terraform.workspace}"
  }

  depends_on = [azurerm_virtual_network.weight_app_network]
}

# connecting [SUBNET] to nsg
resource "azurerm_subnet_network_security_group_association" "sysadmin_subnet" {
  network_security_group_id = azurerm_network_security_group.sysadmin_nsg.id
  subnet_id                 = azurerm_subnet.sysadmin_subnet.id
}
# connecting fe_vms [NIC] to fe nsg
resource "azurerm_network_interface_security_group_association" "nics_nsg" {
  count                     = "${var.TF_VAR_machines}"
  network_interface_id      = azurerm_network_interface.nics[count.index].id
  network_security_group_id = azurerm_network_security_group.sysadmin_nsg.id
}
