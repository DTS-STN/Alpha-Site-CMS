resource "random_password" "alphasite-db-pass-dev" {
  length = 16
  special = false
}

resource "azurerm_key_vault_secret" "alphasite-db-pass-dev" {
  name     = "alphasite-db-pass-dev"
  value    = random_password.alphasite-db-pass-dev.result
  key_vault_id = var.keyvault_id_dev
}

resource "random_password" "alphasite-strapi-admin-jwt-secret-dev" {
  length = 32
  special = false
}

resource "azurerm_key_vault_secret" "alphasite-strapi-admin-jwt-secret-dev" {
  name     = "alphasite-strapi-admin-jwt-secret-dev"
  value    = random_password.alphasite-strapi-admin-jwt-secret-dev.result
  key_vault_id = var.keyvault_id_dev
}


resource "azurerm_postgresql_server" "alphasite-pgsql-server-dev" {
  name                = "alphasite-pgsql-server-dev"
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
  name                = "alphasitedbdev"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.alphasite-pgsql-server-dev.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}