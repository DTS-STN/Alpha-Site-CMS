output "alphasite-pgsql-server-dev-id" {
    value = azurerm_postgresql_server.alphasite-pgsql-server-dev.id
}

output "alphasite-pgsql-server-dev-fqdn" {
    value = azurerm_postgresql_server.alphasite-pgsql-server-dev.fqdn
}

output "alphasite-db-dev-id" {
    value = azurerm_postgresql_database.alphasite-db-dev.id
}

output "alphasite-strapi-admin-jwt-secret-dev" {
    value = azurerm_key_vault_secret.alphasite-strapi-admin-jwt-secret-dev.value
}