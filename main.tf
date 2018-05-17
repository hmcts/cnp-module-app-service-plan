data "template_file" "deployASP" {
  template = "${file("${path.module}/deployASP.json")}"
}

# Deploy the App Service Plan
resource "azurerm_template_deployment" "app_service_plan" {
  template_body       = "${data.template_file.deployASP.rendered}"
  name                = "${var.product}-${var.env}-asp-webapp"
  resource_group_name = "${var.resourcegroupname}"
  deployment_mode     = "Incremental"

  parameters = {
    name         = "${var.product}-${var.env}"
    location     = "${var.location}"
    env          = "${var.env}"
    asp_capacity = "${var.asp_capacity}"
    asp_name     = "${var.asp_name}-${var.env}"
    ase_name     = "${var.ase_name_list}"
    tags         = "${var.tags_list}"
  }
}
