
output "tags" {
  value       = "${azurerm_app_service_plan.app_service_plan.tags}"
  description = "tags"
}