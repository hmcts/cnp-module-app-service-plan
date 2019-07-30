output "aspResourceID" {
  value = "${var.aspEnabled == "true" ? ${azurerm_template_deployment.app_service_plan.outputs["aspResourceID"]} : null}"
}
