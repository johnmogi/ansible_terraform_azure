# Default = production, staging enviroments / workspaces.
locals {
  name = "${terraform.workspace}"
  tags = merge(var.tags, {"env" = terraform.workspace, "app" = local.name})

}

# Main resource group- dynamic switch staging and production groups
resource "azurerm_resource_group" "weight-app" {
  name     =  "${local.name}-${var.group}"
  location = "East Us"

}


# Creates the postgreSQL server (managed database)
# module "postgres" {
#   source          = "./modules/postgres"
#   rg_name         = azurerm_resource_group.weight-app.name
#   location = var.location
#   db_subnet       = azurerm_subnet.backend_subnet
#   vnet            = azurerm_virtual_network.weight_app_network
#   pg_password     = "5pSi8DJ7yk8f"
# }