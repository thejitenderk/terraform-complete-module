module "resource_group" {
  source              = "../child_module/azurerm_resource_group"
  resource_group_name = "todo-hard-rg"
  location            = "West Europe"
}

module "virual_network" {
  depends_on           = [module.resource_group]
  source               = "../child_module/azurerm_virtual_network"
  virtual_network_name = "todo-hard-vnet"
  resource_group_name  = "todo-hard-rg"
  location             = "west europe"
  address_space        = ["10.0.0.0/16"]
}

module "subnet1" {
  depends_on           = [module.virual_network, module.resource_group]
  source               = "../child_module/azurerm_subnet"
  subnet_name          = "frontend-subnet"
  address_prefixes     = ["10.0.0.0/24"]
  virtual_network_name = "todo-hard-vnet"
  resource_group_name  = "todo-hard-rg"
}

module "subnet2" {
  depends_on           = [module.virual_network, module.resource_group]
  source               = "../child_module/azurerm_subnet"
  subnet_name          = "backend-subnet"
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = "todo-hard-vnet"
  resource_group_name  = "todo-hard-rg"
}

# module "vm1" {

#   source              = "../child_module/azurerm_linux_virtual_machine"
#   nic_name            = "frontend-nic"
#   pip_name            = "frontend-pip"
#   location            = "West Europe"
#   resource_group_name = "todo-hard-rg"
#   subnet_id           = "/subscriptions/f9182cf3-79c7-402d-a90b-c4ec97f72f88/resourceGroups/todo-hard-rg/providers/Microsoft.Network/virtualNetworks/todo-hard-vnet/subnets/frontend-subnet"
#   vm_name             = "frontend-vm"
#   vm_size             = "Standard_B2ms"
#   admin_username      = "adminuser"
#   admin_password      = "Iwant2learn2025" # Use a secure password in production
#   image_publisher     = "Canonical"
#   image_offer         = "0001-com-ubuntu-server-focal"
#   image_sku           = "20_04-lts"

# }

# module "vm2" {

#   source              = "../child_module/azurerm_linux_virtual_machine"
#   nic_name            = "backend-nic"
#   pip_name            = "backend-pip"
#   location            = "West Europe"
#   resource_group_name = "todo-hard-rg"
#   subnet_id           = "/subscriptions/f9182cf3-79c7-402d-a90b-c4ec97f72f88/resourceGroups/todo-hard-rg/providers/Microsoft.Network/virtualNetworks/todo-hard-vnet/subnets/backend-subnet"
#   vm_name             = "backend-vm"
#   vm_size             = "Standard_B2ms"
#   admin_username      = "adminuser"
#   admin_password      = "Iwant2learn2025" # Use a secure password in production
#   image_publisher     = "Canonical"
#   image_offer         = "0001-com-ubuntu-server-focal"
#   image_sku           = "20_04-lts"

# }


# module "named_sql_server" {
#   source                       = "../child_module/azurerm_mssql_server"
#   mssql_server_name            = "todohardsqlserver45"
#   resource_group_name          = "todo-hard-rg"
#   location                     = "centralindia"
#   administrator_login          = "sqladmin"
#   administrator_login_password = "Iwant2learn2025" # Use a secure password in production

# }

# module "sql_database" {
#   source              = "../child_module/azurerm_mssql_database"
#   database_name       = "todoharddb"
#   server_id           = "/subscriptions/f9182cf3-79c7-402d-a90b-c4ec97f72f88/resourceGroups/todo-hard-rg/providers/Microsoft.Sql/servers/todohardsqlserver45"
# }