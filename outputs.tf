output "aspResourceID" {
  value = "${var.enabled} ? ${azurerm_template_deployment.app_service_plan.outputs["aspResourceID"]} : \"\"}"
}
