
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

variable size {
    type    = string
    default = "Standard_b1s"
}

variable  pool_name {
  default = "webapp_nic"
  description = "load balance flexible data"
}