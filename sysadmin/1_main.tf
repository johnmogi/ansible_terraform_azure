# Default = production, staging enviroments / workspaces.
locals {
  name = "${terraform.workspace}"
  tags = merge(var.tags, {"env" = terraform.workspace, "sys" = local.name})

}

# Main resource group- dynamic switch staging and production groups
resource "azurerm_resource_group" "weight-sysadmin" {
  name     =  "${local.name}-${var.group}-sysadmin"
  location = "East Us"
}
