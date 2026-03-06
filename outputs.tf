output "asp_id" {
  description = "The resource ID of the App Service Plan."
  value       = azurerm_service_plan.app_service_plan.id
}

output "asp_name" {
  description = "The name of the App Service Plan."
  value       = azurerm_service_plan.app_service_plan.name
}

output "asp_identity_principal_id" {
  description = "The principal ID of the system-assigned managed identity on the App Service Plan."
  value       = azurerm_service_plan.app_service_plan.identity[0].principal_id
}

output "asp_identity_tenant_id" {
  description = "The tenant ID of the system-assigned managed identity on the App Service Plan."
  value       = azurerm_service_plan.app_service_plan.identity[0].tenant_id
}

