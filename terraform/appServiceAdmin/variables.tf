#Infrastructure Settings
variable "application_name" {
    type = string
}
variable "location" {
    type = string
}
variable "backup_location"{
    type = string
}
variable "resource_group_name" {
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
