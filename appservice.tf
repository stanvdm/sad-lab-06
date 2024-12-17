resource "azurerm_service_plan" "vandamme-asp-01" {
    name                = "vandamme-asp-${local.name_insert}-01"
    location            = var.location
    resource_group_name = azurerm_resource_group.vandamme-rg-01.name
    os_type             = "Linux"
    sku_name            = "F1"
}

resource "azurerm_linux_web_app" "vandamme-as-01" {
    name                = "vandamme-as-${local.name_insert}-01"
    location            = var.location
    resource_group_name = azurerm_resource_group.vandamme-rg-01.name
    service_plan_id     = azurerm_service_plan.vandamme-asp-01.id
    https_only          = true
    site_config {
        minimum_tls_version = "1.2"
        always_on = false
        application_stack {
            dotnet_version  = "8.0"
        }
    }
}