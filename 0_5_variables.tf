
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
    default = "3"
}

variable size {
    type    = string
    default = "Standard_b1s"
}