# 2. Automatically Create the Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = "candleRegistry" # Must be globally unique and alphanumeric
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic" # Basic is perfect for development and budget-friendly
  admin_enabled       = false   # Disabled because we are using Managed Identity for security instead
}

# 3. Create the App Service Plan
resource "azurerm_service_plan" "sp" {
  name                = "candle-store-sp-dev"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
  depends_on = [
    azurerm_resource_group.rg
  ]
}

# 4. Deploy the Linux Web App
resource "azurerm_linux_web_app" "webApp" {
  name                = "samuel-candle-store-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.sp.id

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = true

    # Tell App Service to authenticate using its Managed Identity
    container_registry_use_managed_identity = true

    application_stack {
      docker_image_name   = "candle-store:latest"
      # Dynamically grab the login server from the new ACR resource block above
      docker_registry_url = "https://${azurerm_container_registry.acr.login_server}"
    }
  }
}

# 5. Dynamic Role Assignment using the created registry's ID
resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_linux_web_app.webApp.identity[0].principal_id
}
