resource "azurerm_resource_group" "azure" {
  name     = "rg-databricks"
  location = var.azure_region
}

resource "azurerm_virtual_network" "azure" {
  name                = "vnet-databricks"
  address_space       = ["10.11.0.0/16"]
  location            = azurerm_resource_group.azure.location
  resource_group_name = azurerm_resource_group.azure.name
}

resource "azurerm_subnet" "public" {
  name                 = "snet-databricks-public"
  resource_group_name  = azurerm_resource_group.azure.name
  virtual_network_name = azurerm_virtual_network.azure.name
  address_prefixes     = ["10.11.1.0/24"]
}

resource "azurerm_databricks_workspace" "azure" {
  name                        = "azure_workspace"
  resource_group_name         = azurerm_resource_group.azure.name
  location                    = azurerm_resource_group.azure.location
  sku                         = "premium"
  managed_resource_group_name = "rg-databricks-managed"
}