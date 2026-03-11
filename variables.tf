# ---------------------------------------------------------------------------
# SHARED VARIABLES
# ---------------------------------------------------------------------------

variable "location" {
  type        = string
  description = "The Azure region where you would like to deploy your App Service Plan."
  default     = "UK South"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the App Service Plan to be deployed to."
}

variable "env" {
  type        = string
  description = "The deployment environment (sandbox, aat, prod, etc.)."
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags applied to all resources."
  default     = {}
}

variable "tag_list" {
  type        = map(string)
  description = "Additional tags to be applied to each resource."
  default     = {}
}

# ---------------------------------------------------------------------------
# APP SERVICE PLAN VARIABLES
# ---------------------------------------------------------------------------

variable "asp_name" {
  type        = string
  description = "Base name of the App Service Plan. The environment suffix is appended automatically."
}

variable "os_type" {
  type        = string
  description = "The OS type for the App Service Plan. Possible values are Windows, Linux, or WindowsContainer."
  default     = "Linux"

  validation {
    condition     = contains(["Windows", "Linux", "WindowsContainer"], var.os_type)
    error_message = "os_type must be one of: Windows, Linux, WindowsContainer."
  }
}

variable "asp_sku_size" {
  type        = string
  description = "The SKU name for the App Service Plan (e.g. P1v3, P2v3, I1v2, I2v2, B1, S1)."
  default     = "B1"
}

variable "asp_capacity" {
  type        = number
  description = "The number of workers (instances) associated with this App Service Plan."
  default     = 1
}

variable "app_service_environment_id" {
  type        = string
  description = "The resource ID of an App Service Environment to host the plan in. Leave empty for a multi-tenant plan."
  default     = ""
}

variable "zone_balancing_enabled" {
  type        = bool
  description = "Should the App Service Plan balance across availability zones? Requires a Premium or higher SKU (e.g. P1v3). Not supported on B1/S1."
  default     = false
}



