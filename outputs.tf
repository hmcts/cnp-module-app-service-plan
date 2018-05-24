output "aspResourceID" {
  value = "${azurerm_template_deployment.app_service_plan.outputs["aspResourceID"]}"
}

output "aseResourceID" {
  value = "${azurerm_template_deployment.app_service_plan.outputs["aseResourceID"]}"
}

output "ipbIP" {
  depends_on = "${azurerm_template_deployment.app_service_plan}"
  value      = "${file("ip.txt")}"
}
