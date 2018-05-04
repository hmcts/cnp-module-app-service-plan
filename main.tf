resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "${var.product}-shared-ASP"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  sku {
    tier     = "${var.asp_sku_tier}"
    size     = "${var.asp_sku_size}"
    capacity = "${var.asp_sku_capacity}"
  }

  properties {
    app_service_environment_id = "${var.asp_properties_app_service_environment_id}"
    maximum_number_of_workers  = "${var.asp_properties_maximum_number_of_workers}"
    per_site_scaling           = "${var.asp_properties_per_site_scaling}"
  }

  tags {
    "Deployment Environment" = "${var.env}"
    "Team Name"              = "${var.team_name}"
    "Team Contact"           = "${var.team_contact}"
    "Destroy Me"             = "${var.destroy_me}"
  }
}
