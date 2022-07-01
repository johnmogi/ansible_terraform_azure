# Sysadmin worker
resource "azurerm_subnet" "sysadmin_subnet" {
  address_prefixes     = ["10.0.30.0/26"] 
  name                 = "sysadminSubnet"
  resource_group_name  = azurerm_resource_group.weight-app.name
  virtual_network_name = azurerm_virtual_network.weight_app_network.name

  depends_on =  [azurerm_resource_group.weight-app]
}


# Sysadmin network_interface 
resource "azurerm_network_interface" "sys_nic" {
  location            = var.location
  name                = "sysadmin_${var.sysadmin_machine}-nic"
  resource_group_name  = azurerm_resource_group.weight-app.name

  ip_configuration {
    name                          = var.command_nic_ip_configuration_name
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.sysadmin_ip.id
    subnet_id                     = azurerm_subnet.sysadmin_subnet.id

  }

  depends_on = [
    azurerm_resource_group.weight-app,
    azurerm_subnet.sysadmin_subnet
  ]

}
# # availability_set
# resource "azurerm_availability_set" "weight_app_avs" {
#   name                         = "frontend_avs"
#   location                     = var.location
#   resource_group_name          = azurerm_resource_group.weight-app.name
#   platform_fault_domain_count  = "${var.TF_VAR_machines}"
#   platform_update_domain_count = "${var.TF_VAR_machines}"
#   managed                      = true

#   depends_on          = [azurerm_resource_group.weight-app]

# }