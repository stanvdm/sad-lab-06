terraform {
    required_providers {
        azurerm = {
        source = "hashicorp/azurerm"
        version = " =4.10.0"
        }
    }
}

provider "azurerm" {
    subscription_id         = "9cce6e20-3b97-4453-a880-2d4a5d1fefdb"
    resource_provider_registrations = "none"
    features {}
}

resource "azurerm_resource_group" "vandamme-rg-01" {
    name                    = "vandamme-rg-${terraform.workspace}-${lower(replace(var.location," ",""))}-01"
    location                = var.location
}