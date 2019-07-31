output "aspResourceID" {
  value = "${lookup(azurerm_template_deployment.app_service_plan.outputs, "storageAccountName", "No ASP")}"
}
