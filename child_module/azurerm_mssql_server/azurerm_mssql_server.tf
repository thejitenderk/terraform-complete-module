resource "azurerm_mssql_server" "example" {
  name                         = var.mssql_server_name
    resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = "1.2"


}