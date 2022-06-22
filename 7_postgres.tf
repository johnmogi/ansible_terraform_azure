# # private_dns_zone
# resource "azurerm_private_dns_zone" "dbDnsZone" {
#   name                = "dbDnsZone.postgres.database.azure.com"
#   resource_group_name  = azurerm_resource_group.weight-app.name

#   depends_on = [azurerm_virtual_network.weight_app_network]
# }

# # private_dns_zone_virtual_network_link
# resource "azurerm_private_dns_zone_virtual_network_link" "network_link" {
#   name                  = "weightracker"
#   private_dns_zone_name = azurerm_private_dns_zone.dbDnsZone.name
#   resource_group_name  = azurerm_resource_group.weight-app.name
#   virtual_network_id    = azurerm_virtual_network.weight_app_network.id

#   depends_on = [azurerm_virtual_network.weight_app_network]

# }

# # postgresql_flexible_server
# resource "azurerm_postgresql_flexible_server" "backendServer" {
#   name                   = "postgres"
#   resource_group_name    = azurerm_resource_group.weight-app.name
#   location               = var.location
#   version                = "13"
#   delegated_subnet_id    = azurerm_subnet.backend_subnet.id
#   private_dns_zone_id    = azurerm_private_dns_zone.dbDnsZone.id
#   administrator_login    = "${var.TF_VAR_db_username}"
#   administrator_password = "${var.TF_VAR_db_password}"
#   storage_mb             = 131072
#   sku_name               = "GP_Standard_D2s_v3"
#   backup_retention_days  = 7
#   zone = "1"

#   depends_on = [azurerm_private_dns_zone_virtual_network_link.network_link]

# }

# # server_database
# resource "azurerm_postgresql_flexible_server_database" "database" {
#   name      = "postgres"
#   server_id = azurerm_postgresql_flexible_server.backendServer.id
#   collation = "en_US.UTF8"
#   charset   = "UTF8"

#   depends_on = [azurerm_postgresql_flexible_server.backendServer]

# }

# # server_configuration
# resource "azurerm_postgresql_flexible_server_configuration" "server_configuration" {
#   name      = "backslash_quote"
#   server_id = azurerm_postgresql_flexible_server.backendServer.id
#   value     = "on"

#   depends_on = [azurerm_postgresql_flexible_server_database.database]

# }

