output "asp_id" {
  description = "The resource ID of the App Service Plan."
  value       = azurerm_service_plan.app_service_plan.id
}

output "asp_name" {
  description = "The name of the App Service Plan."
  value       = azurerm_service_plan.app_service_plan.name
}



