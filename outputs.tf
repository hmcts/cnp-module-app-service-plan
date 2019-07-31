output "aspResourceID" {
  value = "${element(concat(azurerm_template_deployment.app_service_plan.*.outputs, list("")), 0)}"
}
