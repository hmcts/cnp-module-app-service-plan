output "aspResourceID" {
  value = "${var.enabled == "1" ? ${azurerm_template_deployment.app_service_plan.outputs["aspResourceID"]} : \"\"}"
}
