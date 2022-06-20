# Create a random password to access machine
resource "random_password" "fe_password" {
  length           = 12
  special          = true
  override_special = "#$%&*()-_=+[]{}<>:?"
}

# Create Virtual Machines
resource "azurerm_virtual_machine" "weight_app" {
  count                 = var.machine
  location              = var.location
  name                  = "frontend_${count.index}"
  network_interface_ids = [element(azurerm_network_interface.nics.*.id, count.index)]
  resource_group_name = azurerm_resource_group.weight-app.name
  vm_size               = var.webapp_vm_type_b1s

  storage_os_disk {
    create_option     = var.webapp_create_option
    name              = "WebApp_${count.index + 1}-${var.vm_disk_name}"
    caching           = var.webapp_disk_catch
    managed_disk_type = var.managed_disk_type
  }

  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.linux_sku
    version   = var.os_version
  }

  os_profile {
    admin_username = var.admin_username
    admin_password = random_password.fe_password.result
    computer_name  = "webapp${count.index}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}