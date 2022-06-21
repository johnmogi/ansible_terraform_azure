
variable "name"{
  default = "weight_app"
  
}
variable "group" {
  default = "weight_app_rg"
}
variable "location"{
  default = "East Us"
  
}
variable "tags" {
  default = {
    project = "weight-app"
  }
}
variable prefix {
    type    = string
    default = "weight_app" 
}

variable machines {
    type = number
    default = 2 
}
variable sysadmin_ip{
  type    = string
  default= "sysadmin_ip"

}
variable "command_vm_name" {
  description = "Name of the Terminal VM"
  default     = "CMD"

}
variable command_nic_ip_configuration_name {
  description = "connection to vm sysadmin"
  default = "sysadmin_ip_con"
}

variable size {
    type    = string
    default = "Standard_b1s"
}

# one connection to pool them all
variable  pool_name {
  default = "webapp_nic" 
  description = "load balance flexible data"
}
