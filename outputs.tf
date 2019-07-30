output "aspResourceID" {
  value = "${var.aspEnabled ? ${azurerm_template_deployment.app_service_plan.outputs["aspResourceID"]} : null}"
}
