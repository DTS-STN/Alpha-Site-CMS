resource "azurerm_app_service_slot" "app-service-primary-staging" {
    name                    = "staging-api"
    app_service_name        = azurerm_app_service.app-service-primary.name
    location                = var.location
    resource_group_name     = var.resource_group_name
    app_service_plan_id     = azurerm_app_service_plan.app-service-plan-primary.id
    https_only              = true
    client_affinity_enabled = true

    site_config {
        always_on = "true"

        linux_fx_version  = "DOCKER|${var.staging_docker_registry}/${var.staging_docker_container}"

        health_check_path = var.healthcheck_page # health check required in order that internal app service plan loadbalancer do not loadbalance on instance down
    }

    identity {
        type = "SystemAssigned"
    }

    app_settings = {
        "APP_SERVICE"                     = "true"
        "DOCKER_REGISTRY_SERVER_URL"      = var.staging_docker_registry
        "DOCKER_REGISTRY_SERVER_USERNAME" = var.staging_docker_registry_username
        "DOCKER_REGISTRY_SERVER_PASSWORD" = var.staging_docker_registry_password
        "SLOT_NAME"                       = "default"
        "DATABASE_HOST" = "alphasite-pgsql-server-dev.postgres.database.azure.com"
        "DATABASE_PORT" = 5432
        "DATABASE_USERNAME" = var.database_user_dev
        "DATABASE_PASSWORD" = var.database_pass_dev
        "DATABASE_SSL" = true
        "STRAPI_API_BACKEND_URL" = "alphasite2.dts-stn.com"
        "STRAPI_API_HOST" = "0.0.0.0" 
        "STRAPI_API_PORT" = 1337
        "STRAPI_STORAGE" = "azure"
        "STORAGE_ACCOUNT" = var.storage_account_name
        "STORAGE_ACCOUNT_KEY" = var.storage_account_key
        "STORAGE_ACCOUNT_URL" = var.storage_account_url
        "STORAGE_ACCOUNT_CONTAINER" = var.application_name
        "STRAPI_ADMIN_JWT_SECRET" = var.alphasite-strapi-admin-jwt-secret-dev
        "WEBSITES_PORT" = 1337
    }

}

resource "azurerm_app_service_slot" "app-service-secondary-staging" {
    name                    = "staging-api"
    app_service_name        = azurerm_app_service.app-service-secondary.name
    location                = var.backup_location
    resource_group_name     = var.resource_group_name
    app_service_plan_id     = azurerm_app_service_plan.app-service-plan-secondary.id
    https_only              = true
    client_affinity_enabled = true

    site_config {
        always_on = "true"

        linux_fx_version  = "DOCKER|${var.staging_docker_registry}/${var.staging_docker_container}"

        health_check_path = var.healthcheck_page # health check required in order that internal app service plan loadbalancer do not loadbalance on instance down
    }

    identity {
        type = "SystemAssigned"
    }

    app_settings = {
        "APP_SERVICE"                     = "true"
        "DOCKER_REGISTRY_SERVER_URL"      = var.staging_docker_registry
        "DOCKER_REGISTRY_SERVER_USERNAME" = var.staging_docker_registry_username
        "DOCKER_REGISTRY_SERVER_PASSWORD" = var.staging_docker_registry_password
        "SLOT_NAME"                       = "default"
        "DATABASE_HOST" = "alphasite-pgsql-server-dev.postgres.database.azure.com"
        "DATABASE_PORT" = 5432
        "DATABASE_USERNAME" = var.database_user_dev
        "DATABASE_PASSWORD" = var.database_pass_dev
        "DATABASE_SSL" = true
        "STRAPI_API_BACKEND_URL" = "alphasite2.dts-stn.com"
        "STRAPI_API_HOST" = "0.0.0.0" 
        "STRAPI_API_PORT" = 1337
        "STRAPI_STORAGE" = "azure"
        "STORAGE_ACCOUNT" = var.storage_account_name
        "STORAGE_ACCOUNT_KEY" = var.storage_account_key
        "STORAGE_ACCOUNT_URL" = var.storage_account_url
        "STORAGE_ACCOUNT_CONTAINER" = var.application_name
        "STRAPI_ADMIN_JWT_SECRET" = var.alphasite-strapi-admin-jwt-secret-dev
        "WEBSITES_PORT" = 1337
    }

}