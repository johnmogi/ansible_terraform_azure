# Create Virtual Machines
  module "vm_front"{
  source = "./modules/frontend"
  count=var.machines
  pass_count=var.machines
  location       = var.location
  rg_name = azurerm_resource_group.weight_app.name
  admin_username = "${var.TF_VAR_admin_username}"
  admin_password = "${var.TF_VAR_admin_password}"
  vm_front = "frontendMachine${count.index}"
  size=var.size
  nic_fe_ids = [element(azurerm_network_interface.nics.*.id, count.index)]
  
  }

# azurerm_linux_virtual_machine vs azurerm_virtual_machine - why? testing...
resource "azurerm_linux_virtual_machine" "sysadmin_vm" {
  name                            = "sysadmin_${var.sysadmin_machine}"
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
