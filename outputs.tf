output "asp_id" {
  value       = "${azurerm_app_service_plan.app_service_plan.id}"
  description = "The ID of the App Service Plan component."
}
