Sela week 6 starts with a bang, trying to recover and upgrade


fix names, variables clean up tf code




ansible_terraform_azure

how to change variables on enviroment?
for instance var.machine 2 staging | 3 prod
or size                   = "Standard_b2s"


connect nsg to nic to vm

load balancer no health probes

# connect be nic to nsg

resource "azurerm_network_interface_security_group_association" "be_nsg_assoc" {
network_interface_id = azurerm_network_interface.network_interface_db[0].id
network_security_group_id = azurerm_network_security_group.backend_subnet.id
} # connect fe nic to nsg
resource "azurerm_network_interface_security_group_association" "fe_nsg_assoc" {
network_interface_id = azurerm_network_interface.network_interface_app[0].id
network_security_group_id = azurerm_network_security_group.frontend_subnet.id
} # connect fe nic to nsg
resource "azurerm_network_interface_security_group_association" "fe_nsg_assoc1" {
network_interface_id = azurerm_network_interface.network_interface_app[1].id
network_security_group_id = azurerm_network_security_group.frontend_subnet.id
} # connect fe nic to nsg
resource "azurerm_network_interface_security_group_association" "fe_nsg_assoc2" {
network_interface_id = azurerm_network_interface.network_interface_app[2].id
network_security_group_id = azurerm_network_security_group.frontend_subnet.id
}

<!-- need to build a deploy-

production | staging -->

db to last oction
!! once db is built
connect be nic to nsg

output:
export password and user

take care that staging is smaller then production as in vm b1s + 2 vm's on stage

providers.tf {connect to azure}
main.tf { group + locals} // staging prod
network.tf { create vnet + subnets}
nsg { create security rules} -> need to connect to nic?
modules-vm
loadbalance -> ip + machines + nic mash it all up!
