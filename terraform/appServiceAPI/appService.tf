# Create App Services
resource "azurerm_app_service" "app-service-primary" {
  name                = "${var.application_name}-api-as-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.primary_app_service_plan_id
  https_only          = true

  site_config {
    always_on = "true"

# TODO change docker values to production

    linux_fx_version  = "DOCKER|${var.staging_docker_registry}/${var.staging_docker_container_api}" #define the images to use for your application

    health_check_path = var.healthcheck_page # health check required in order that internal app service plan loadbalancer do not loadbalance on instance down

    ip_restriction {
      virtual_network_subnet_id  = var.subnet_id
      priority = 301
    }

  }


  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "APP_SERVICE" = "true"
    "DOCKER_REGISTRY_SERVER_URL" = var.staging_docker_registry
    "DOCKER_REGISTRY_SERVER_USERNAME" = var.staging_docker_registry_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = var.staging_docker_registry_password
    "SLOT_NAME" = "default"
    "DATABASE_HOST" = var.database_host_dev
    "DATABASE_PORT" = var.database_port
    "DATABASE_NAME" = var.database_name_dev
    "DATABASE_USERNAME" = var.database_login_dev
    "DATABASE_PASSWORD" = var.database_pass_dev
    "DATABASE_SSL" = true
    "STRAPI_API_BACKEND_URL" = var.api_url_dev
    "STRAPI_ADMIN_BACKEND_URL" = var.api_url_dev
    "STRAPI_API_HOST" = "0.0.0.0"
    "STRAPI_API_PORT" = var.api_port
    "STRAPI_STORAGE" = "azure"
    "STORAGE_ACCOUNT" = var.storage_account_name
    "STORAGE_ACCOUNT_KEY" = var.storage_account_key
    "STORAGE_ACCOUNT_URL" = var.storage_account_url
    "STORAGE_ACCOUNT_CONTAINER" = var.application_name
    "STRAPI_ADMIN_JWT_SECRET" = var.alphasite-strapi-admin-jwt-secret-dev

  }

}

resource "azurerm_app_service" "app-service-secondary" {
  name                = "${var.application_name}-api-as-${var.backup_location}"
  location            = var.backup_location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.secondary_app_service_plan_id
  https_only          = true

  site_config {
    always_on = "true"

    linux_fx_version  = "DOCKER|${var.staging_docker_registry}/${var.staging_docker_container_api}" #define the images to usecfor you application

    health_check_path = var.healthcheck_page # health check required in order that internal app service plan loadbalancer do not loadbalance on instance down

    ip_restriction {
      virtual_network_subnet_id  = var.subnet_id_secondary
      priority = 301
    }

  }


  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "APP_SERVICE" = "true"
    "DOCKER_REGISTRY_SERVER_URL" = var.staging_docker_registry
    "DOCKER_REGISTRY_SERVER_USERNAME" = var.staging_docker_registry_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = var.staging_docker_registry_password
    "SLOT_NAME" = "default"
    "DATABASE_HOST" = var.database_host_dev
    "DATABASE_PORT" = var.database_port
    "DATABASE_NAME" = var.database_name_dev
    "DATABASE_USERNAME" = var.database_login_dev
    "DATABASE_PASSWORD" = var.database_pass_dev
    "DATABASE_SSL" = true
    "STRAPI_API_BACKEND_URL" = var.api_url_dev
    "STRAPI_ADMIN_BACKEND_URL" = var.api_url_dev
    "STRAPI_API_HOST" = "0.0.0.0"
    "STRAPI_API_PORT" = var.api_port
    "STRAPI_STORAGE" = "azure"
    "STORAGE_ACCOUNT" = var.storage_account_name
    "STORAGE_ACCOUNT_KEY" = var.storage_account_key
    "STORAGE_ACCOUNT_URL" = var.storage_account_url
    "STORAGE_ACCOUNT_CONTAINER" = var.application_name
    "STRAPI_ADMIN_JWT_SECRET" = var.alphasite-strapi-admin-jwt-secret-dev
  }

}
