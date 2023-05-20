variable "resource_group_name" {
    type = string
}

variable "location" {
    type = string
}

variable "adf_dev_name" {
  type        = string
  description = "Name of azure data factory dev"
}

variable "adf_staging_name" {
  type        = string
  description = "Name of azure data factory staging"
}

variable "adf_prod_name" {
  type        = string
  description = "Name of azure data factory prod"
}

resource "azurerm_data_factory" "adf-dev" {
  name                = var.adf_dev_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_data_factory" "adf-staging" {
  name                = var.adf_staging_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_data_factory" "adf-prod" {
  name                = var.adf_prod_name
  location            = var.location
  resource_group_name = var.resource_group_name
}