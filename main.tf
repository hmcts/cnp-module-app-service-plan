# data "template_file" "deployASP" {
#   template = "${file("${path.module}/deployASP.json")}"
# }

locals {
  asp_name = "${var.asp_name}-${var.env}"
}

# # Deploy the App Service Plan
# resource "azurerm_template_deployment" "app_service_plan" {
#   template_body       = "${data.template_file.deployASP.rendered}"
#   name                = "${local.asp_name}"
#   resource_group_name = "${var.resource_group_name}"
#   deployment_mode     = "Incremental"

#   parameters = {
#     location     = "${var.location}"
#     env          = "${var.env}"
#     asp_capacity = "${var.asp_capacity}"
#     asp_name     = "${local.asp_name}"
#     kind         = "${var.linux == "true" ? "linux" : "app"}"
#     reserved     = "${var.linux == "true" ? "true" : "false"}"
#     asp_sku_size = "${var.asp_sku_size}"
#     ase_name     = "${var.ase_name}"
#     tag_list     = "${jsonencode(merge(var.common_tags, var.tag_list))}"
#   }
# }

resource "azurerm_app_service_plan" "app_service_plan" {
  # template_body       = "${data.template_file.deployASP.rendered}"
  name                = "${local.asp_name}"
  resource_group_name = "${var.resource_group_name}"
  #deployment_mode     = "Incremental"
  location     = "${var.location}"
  
  kind         = "${var.linux == "true" ? "linux" : "app"}"
  #reserved     = "${var.linux == "true" ? "true" : "false"}"

  sku {
    tier = "Isolated"
    size = "${var.asp_sku_size}"
    capacity = "${var.asp_capacity}"
  }

  properties{
    app_service_environment_id = "/subscriptions/${var.subscriptionId}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Web/hostingEnvironments/${var.ase_name}"
  }
    tags = "${merge(var.common_tags, var.tag_list)}"
    //tags = "${var.tag_list}"
}