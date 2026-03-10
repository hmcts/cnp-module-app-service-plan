# cnp-module-app-service-plan
Terraform module for creating an Azure App Service Plan (`azurerm_service_plan`).

## Variables

| Name | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `location` | string | No | `"UK South"` | Azure region to deploy the App Service Plan |
| `resource_group_name` | string | Yes | - | Resource group to deploy the App Service Plan into |
| `asp_name` | string | Yes | - | Base name of the App Service Plan. The environment suffix is appended automatically |
| `env` | string | Yes | - | Deployment environment (e.g. sbox, aat, stg, prod) |
| `os_type` | string | No | `"Linux"` | OS type for the App Service Plan. Possible values: `Windows`, `Linux`, `WindowsContainer` |
| `asp_sku_size` | string | No | `"B1"` | SKU name for the App Service Plan (e.g. `B1`, `S1`, `P1v3`) |
| `asp_capacity` | number | No | `1` | Number of workers (instances) for the App Service Plan |
| `app_service_environment_id` | string | No | `""` | Resource ID of an App Service Environment to host the plan in. Leave empty for a multi-tenant plan |
| `common_tags` | map(string) | No | `{}` | Common tags applied to all resources |
| `tag_list` | map(string) | No | `{}` | Additional tags to be applied to each resource |

## Usage

```terraform
module "app_service_plan" {
  source = "git@github.com:hmcts/cnp-module-app-service-plan?ref=master"

  asp_name            = var.product
  env                 = var.env
  location            = var.location
  resource_group_name = local.shared_infra_rg
  asp_sku_size        = var.asp_sku_size
  asp_capacity        = var.asp_capacity
  common_tags         = var.common_tags
}
```

To use a Windows App Service Plan:

```terraform
module "app_service_plan" {
  source = "git@github.com:hmcts/cnp-module-app-service-plan?ref=master"

  asp_name            = var.product
  env                 = var.env
  location            = var.location
  resource_group_name = local.shared_infra_rg
  os_type             = "Windows"
  common_tags         = var.common_tags
}
```

## Outputs

| Name | Description |
| --- | --- |
| `asp_id` | Resource ID of the App Service Plan |
