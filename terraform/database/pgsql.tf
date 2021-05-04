resource "azurerm_postgresql_server" "alphasite-pgsql-server-dev" {
  name                = var.database_server_dev
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = var.database_user_dev
  administrator_login_password = var.database_pass_dev
  version                      = "11"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "alphasite-db-dev" {
  name                = var.database_name_dev
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.alphasite-pgsql-server-dev.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}