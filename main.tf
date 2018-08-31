data "template_file" "deployASP" {
  template = "${file("${path.module}/deployASP.json")}"
}

locals {
  asp_name = "${var.asp_name}-${var.env}"
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
    asp_os       = "${var.asp_os}"
    asp_sku_size = "${var.asp_sku_size}"
    ase_name     = "${var.ase_name}"
    tag_list     = "${jsonencode(var.tag_list)}"
    time_stamp   = "${timestamp()}"
  }
}

resource "null_resource" "ilbIp" {
  triggers {
    trigger = "${azurerm_template_deployment.app_service_plan.parameters.time_stamp}"
  }

  provisioner "local-exec" {
    command = "bash -e ${path.module}/getIP.sh ${azurerm_template_deployment.app_service_plan.outputs["aseResourceID"]} ${path.module}"
  }
}

data "local_file" "ilbIp" {
  filename   = "${path.module}/ip.txt"
  depends_on = ["null_resource.ilbIp"]
}
