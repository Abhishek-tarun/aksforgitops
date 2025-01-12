##Creating virtual nwtwork
resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg-aks.location
  resource_group_name = azurerm_resource_group.rg-aks.name 
}

##Creating subnet
resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  resource_group_name  = azurerm_resource_group.rg-aks.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.1.1.0/16"]
}