# 2. Automatically Create the Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = "candleRegistry" # Must be globally unique and alphanumeric
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic" # Basic is perfect for development and budget-friendly
  admin_enabled       = false   # Disabled because we are using Managed Identity for security instead
}

