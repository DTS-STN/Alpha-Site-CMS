
# Azure Login Settings
variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {}

#Infrastructure Settings
variable "location" {
    type = string
}
variable "backup_location" {
    type = string
}
variable "resource_group_name" {
    type = string
}
variable "environment" {
    type = string
}
variable "depot_resource_group_name" {
    type = string
}
variable "application_name" {
    type = string
}
variable "keyvault_id_dev" {
    type = string
}
variable "database_host_dev" {
    type = string
}
variable "database_port" {
    type = number
}
variable "database_login_dev" {
    type = string
}
variable "database_name_dev" {
    type = string
}
variable "database_server_dev" {
    type = string
}
variable "database_user_dev" {
    type = string
}
variable "database_pass_dev" {
    type = string
}
variable "storage_account_name" {
    type = string
}
variable "storage_account_key" {
    type = string
}
variable "storage_account_url" {
    type = string
}
variable "alphasite-strapi-admin-jwt-secret-dev" {
    type = string
}
variable "subnet_id" {
    type = string
}
variable "subnet_id_secondary" {
    type = string
}
variable "diagnostic_storage_account_id" {
    type = string
}
variable "diagnostic_storage_account_id_secondary" {
    type = string
}
variable "staging_docker_registry" {
    type = string
}
variable "staging_docker_container_api" {
    type = string
}
variable "staging_docker_container_admin" {
    type = string
}
variable "staging_docker_registry_username" {
    type = string
}
variable "staging_docker_registry_password" {
    type = string
}
variable "healthcheck_page" {
    type = string
}
variable "api_url_dev" {
    type = string
}
variable "api_port" {
    type = number
}
variable "primary_app_service_plan_id" {
    type = string
}
variable "secondary_app_service_plan_id" {
    type = string
}
