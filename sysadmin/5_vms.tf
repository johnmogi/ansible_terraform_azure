# Create Virtual Machines
  module "vm_sysadmin"{
  source = "./modules/sysadmin"
  count="${var.TF_VAR_machines}"
  location       = var.location
  size="${var.TF_VAR_size}"
  rg_name = "${local.name}-${var.group}"
  admin_username = "${var.TF_VAR_admin_username}"
  admin_password = "${var.TF_VAR_admin_password}"
  vm_front = "sysadminMachine${count.index}+1"
  pass_count="${var.TF_VAR_machines}"
  nic_fe_ids = [element(azurerm_network_interface.nics.*.id, count.index)]
  
  }

