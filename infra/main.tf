
data "azurerm_subscription" "primary" {}

data "azurerm_client_config" "current" {}

resource "random_string" "suffix" {
  length  = 4
  lower   = true
  number  = true
  upper   = false
  special = false
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.disambiguation}-${random_string.suffix.result}"
  location = var.location

  # Uncomment for Demo on Challenges
  # lifecycle {
  #   ignore_changes = [ tags, ]
  # }
}

resource "azurerm_application_insights" "appinsights" {
  application_type    = "web"
  location            = var.location
  name                = "ai-${var.disambiguation}-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  sampling_percentage = 0
  depends_on = [
    azurerm_resource_group.rg
  ]
}


# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "webapp-asp-${var.disambiguation}-${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                  = "webapp-${var.disambiguation}-${random_string.suffix.result}"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
  https_only            = true
  site_config { 
    minimum_tls_version = "1.2"
  }
}
