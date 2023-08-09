output "azurerm_cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.this.name
}

output "db_name" {
  value = azurerm_cosmosdb_sql_database.this.name
}