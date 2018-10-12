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
    kind         = "${var.linux == "true" ? "linux" : "app"}"
    reserved     = "${var.linux == "true" ? "true" : "false"}"
    asp_sku_size = "${var.asp_sku_size}"
    ase_name     = "${var.ase_name}"
    tag_list     = "${jsonencode(merge(var.common_tags, var.tag_list))}"
  }
}
