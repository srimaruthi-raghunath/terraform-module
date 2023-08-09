resource "azurerm_sql_server" "this" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.version
  administrator_login          = var.sqlusername
  administrator_login_password = var.sqlpassword
}

resource "azurerm_sql_database" "this" {
  name                = var.db_name
  resource_group_name = azurerm_sql_server.this.resource_group_name
  location            = azurerm_sql_server.this.location
  server_name         = azurerm_sql_server.name
  depends_on = [
    azurerm_sql_server.this
  ]
}