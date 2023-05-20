variable "resource_group_name" {
    type = string
}

variable "location" {
    type = string
}

variable "storage_account_name1" {
  type = string
}

variable "storage_account_name2" {
  type = string

}

resource "azurerm_storage_account" "storage1" {
  name                     = var.storage_account_name1
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account" "storage2" {
  name                     = var.storage_account_name2
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container1" {
  name                  = "container1"
  storage_account_name  = azurerm_storage_account.storage1.name
  container_access_type = "private"
}

