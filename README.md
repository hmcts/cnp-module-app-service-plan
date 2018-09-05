# cnp-module-app-service-plan
Terraform Module for creating a shared Application Service Plan.

## Variables

Names | Type | Required | Description
--- | --- | --- | --- |
`location` | String | Yes | Location of resouce ie UK SOUTH
`resource_group_name` | String | Yes | Names of shared infra resource group to deploy plan to
`asp_name` | String | Yes | Name of app service plan to be created
`linux` | String | No | Specifies if the ASP should be of kind linux, defaults to windows
`asp_sku_size` | String | No| Size of Worker Instance 'I1' 'I2' 'I3'
`asp_capacity` | String | No | Number of workers to be provisioned with plan, default is 2
`ase_name` | String | Yes | Name of the app service environment the plan should live
`env` | String | Yes | CNP Environment such as sandbox
`tag_list` | Map | Yes | List of tags to be deployed with resource

## Usage

```terraform
module "appServicePlan" {
  source              = "git@github.com:hmcts/moj-module-app-service-plan"
  location            = "UK South"
  env                 = "${var.env}"
  resource_group_name = "${azurerm_resource_group.shared_resource_group.name}"
  asp_capacity        = "${var.asp_capacity}"
  asp_name            = "${var.product}"
  ase_name            = "${local.ase_name}"
  tag_list            = "${local.common_tags}"
}
```
