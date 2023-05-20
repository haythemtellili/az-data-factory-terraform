resource "azurerm_resource_group" "adf-rg" {
  name     = var.resource_group_name
  location = var.location
}

data "azurerm_key_vault" "adf-sql-vault" {
  resource_group_name = "tfstate"
  name = "adf-sql-vault"
}

data "azurerm_key_vault_secret" "sql-username" {
  name = "sql-server-username"
  key_vault_id = data.azurerm_key_vault.adf-sql-vault.id
}

data "azurerm_key_vault_secret" "sql-password" {
  name = "sql-server-password"
  key_vault_id = data.azurerm_key_vault.adf-sql-vault.id
}

module "sql-database" {
  source = "./modules/database"

  resource_group_name = azurerm_resource_group.adf-rg.name
  location = azurerm_resource_group.adf-rg.location
  username = data.azurerm_key_vault_secret.sql-username.value
  password = data.azurerm_key_vault_secret.sql-password.value
}

module "blob-storage" {
  source = "./modules/blob-storage"
  resource_group_name = azurerm_resource_group.adf-rg.name
  location = azurerm_resource_group.adf-rg.location
  storage_account_name1 = var.storage_account_name1
  storage_account_name2 = var.storage_account_name2
}

module "data-factory" {
  source = "./modules/azure-data-factory"
  resource_group_name = azurerm_resource_group.adf-rg.name
  location = azurerm_resource_group.adf-rg.location
  adf_dev_name = var.adf_dev_name
  adf_staging_name = var.adf_staging_name
  adf_prod_name = var.adf_prod_name
}


