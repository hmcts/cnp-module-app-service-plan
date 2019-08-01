output "aspResourceID" {
  value = "${ join("", azurerm_template_deployment.*.app_service_plan.outputs) }"
}
