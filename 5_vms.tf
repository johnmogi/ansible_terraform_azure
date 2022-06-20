# Create a random password to access machine
resource "random_password" "fe_password" {
  length           = 12
  special          = true
  override_special = "#$%&*()-_=+[]{}<>:?"
}

# Create Virtual Machines
resource "azurerm_virtual_machine" "weight_app" {
  count                 = var.machines
  location              = var.location
  name                  = "frontend_${count.index}"
  network_interface_ids = [element(azurerm_network_interface.frontendNics.*.id, count.index)]
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
    admin_username = "azureuser"
    admin_password = random_password.fe_password.result
    computer_name  = "webapp_${count.index}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
    tags = {
    environment = "${terraform.workspace}"
  }
}