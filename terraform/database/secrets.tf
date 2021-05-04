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