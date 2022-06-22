# Create Virtual Machines
resource "azurerm_virtual_machine" "weight_app" {
  count                 = var.machines
  location              = var.location
  name                  = "frontServer-${count.index}"
  network_interface_ids = [element(azurerm_network_interface.nics.*.id, count.index)]
  resource_group_name = azurerm_resource_group.weight-app.name
  vm_size               = var.size

  storage_os_disk {
    name              = "weight_app_disk_${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
  publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  os_profile {
    admin_username = "${var.TF_VAR_admin_username}"
    admin_password = "${var.TF_VAR_admin_password}"
    computer_name  = "webapp${count.index}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
    tags = {
    environment = "${terraform.workspace}"
  }
}
# azurerm_linux_virtual_machine vs azurerm_virtual_machine - why? testing...
resource "azurerm_linux_virtual_machine" "sysadmin_vm" {
  name                            = "Linux_${var.sysadmin_machine}-NIC"
  location                        = var.location
  computer_name                   = "sysadminVmWorker"
  admin_username      = "${var.TF_VAR_admin_username}"
  admin_password = "${var.TF_VAR_admin_password}"

  network_interface_ids           = [azurerm_network_interface.sys_nic.id]
  resource_group_name = azurerm_resource_group.weight-app.name
  size               = var.size
  disable_password_authentication = false

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk { 
    name              = "sysadmin_disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference { 
  publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}
