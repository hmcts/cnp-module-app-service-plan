output "aspResourceID" {
  value = "${azurerm_template_deployment.app_service_plan.outputs["aspResourceID"]}"
}

output "aseResourceID" {
  value = "${azurerm_template_deployment.app_service_plan.outputs["aseResourceID"]}"
}

output "ilbIP" {
  value = "${data.local_file.ilbIP.content}"
}
