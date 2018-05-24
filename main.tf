data "template_file" "deployASP" {
  template = "${file("${path.module}/deployASP.json")}"
}

locals {
  asp_name = "${var.asp_name}-${var.env}-${var.deployment_version}"
}

# Deploy the App Service Plan
resource "azurerm_template_deployment" "app_service_plan" {
  template_body       = "${data.template_file.deployASP.rendered}"
  name                = "${local.asp_name}"
  resource_group_name = "${var.resource_group_name}"
  deployment_mode     = "Incremental"

  parameters = {
    location     = "${var.location}"
    env          = "${var.env}"
    asp_capacity = "${var.asp_capacity}"
    asp_name     = "${local.asp_name}"
    asp_sku_size = "${var.asp_sku_size}"
    ase_name     = "${var.ase_name}"
    tag_list     = "${jsonencode(var.tag_list)}"
    time_stamp   = "${timestamp()}"
  }
}

resource "null_resource" "ilbIP" {
  triggers {
    trigger = "${azurerm_template_deployment.app_service_plan.time_stamp}"
  }

  provisioner "local-exec" {
    command = "env AZURE_CONFIG_DIR=/opt/jenkins/.azure-sandbox bash -e az -v && az resource show --ids ${azurerm_template_deployment.app_service_plan.outputs["aseResourceID"]}/capacities/virtualip --query internalIpAddress"
  }
}
