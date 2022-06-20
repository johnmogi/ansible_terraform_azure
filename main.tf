locals {
  name = "${terraform.workspace}"
  tags = merge(var.tags, {"env" = terraform.workspace, "app" = local.name})
}

resource "azurerm_resource_group" "weight-app" {
  name     = "${local.name}-${var.prefix}"
  location = "East Us"

}
