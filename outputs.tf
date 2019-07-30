output "aspResourceID" {
  value = "${join("",lookup(azurerm_template_deployment.app_service_plan.outputs, "aspResourceID"))}"
}
