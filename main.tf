locals {
  asp_name = "${var.asp_name}-${var.env}"

  # Derive OS type from the linux variable for the service plan resource
  os_type = var.linux ? "Linux" : "Windows"

  merged_tags = merge(var.common_tags, var.tag_list)
}

# App Service Plan (replaces azurerm_template_deployment + ARM template)
resource "azurerm_service_plan" "app_service_plan" {
  name                       = local.asp_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  os_type                    = local.os_type
  sku_name                   = var.asp_sku_size
  worker_count               = var.asp_capacity
  app_service_environment_id = var.app_service_environment_id != "" ? var.app_service_environment_id : null

  identity {
    type = "SystemAssigned"
  }

  tags = local.merged_tags
}

# NOTE: Azure does not support private endpoints directly on an App Service Plan
# (Microsoft.Web/serverFarms). Private endpoints are attached to the individual
# apps (Microsoft.Web/sites) that run on the plan. To restrict network access,
# use VNet integration and access restrictions on the app itself, or use an
# App Service Environment (ASE) which is inherently network-isolated.
