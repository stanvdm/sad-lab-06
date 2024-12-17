resource "azurerm_virtual_network" "vandamme-vnet-01" {
    name                    = "vandamme-vnet-${local.name_insert}-01"
    address_space           = ["172.16.0.0/16"]
    location                = var.location
    resource_group_name     = azurerm_resource_group.vandamme-rg-01.name
}

resource "azurerm_subnet" "vandamme-subnet-01" {
    name                    = "vandamme-subnet-${local.name_insert}-01"
    address_prefixes        = local.selected_subnet_address_prefix
    virtual_network_name    = azurerm_virtual_network.vandamme-vnet-01.name
    resource_group_name     = azurerm_resource_group.vandamme-rg-01.name
}