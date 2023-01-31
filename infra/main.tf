
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

resource "azurerm_log_analytics_workspace" "workspace" {
  name                = "la-${var.disambiguation}-${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azapi_resource" "managed_environment" {
  name      = "me-${var.disambiguation}-${random_string.suffix.result}"
  location  = var.location
  parent_id = azurerm_resource_group.rg.id
  type      = "Microsoft.App/managedEnvironments@2022-03-01"

  body = jsonencode({
    properties = {
      appLogsConfiguration = {
        destination = "log-analytics"
        logAnalyticsConfiguration = {
          customerId = azurerm_log_analytics_workspace.workspace.id
          sharedKey  = azurerm_log_analytics_workspace.workspace.primary_shared_key
        }
      }
    }
  })

  lifecycle {
    ignore_changes = [
        tags
    ]
  }
}
