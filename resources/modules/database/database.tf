variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "username" {
  sensitive = true
  type = string
}

variable "password" {
  sensitive = true
  type = string
}

resource "azurerm_sql_server" "terraform-demo-sqlserver" {
  name                         = "htadfdemosqlserver123"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.username
  administrator_login_password = var.password
}

resource "azurerm_sql_database" "terraform-demo-sql-database" {
  name                = "adf-sql-database"
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.terraform-demo-sqlserver.name
}