//SHARED VARIABLES
variable "product" {
  type        = "string"
  description = "The name of your application"
}

variable "location" {
  type        = "string"
  description = "The Azure region where you would like to deploy your app service plan to"
  default     = "UK South"
}

variable "resource_group_name" {
  type        = "string"
  description = "This is the prefix your resource group name will have for your shared infrastructure"
}

variable "resourcegroupname" {
  type = "string"
}

//APP SERVICE PLAN SPECIFIC VARIABLES
variable "asp_sku_tier" {
  type        = "string"
  description = "(Required) Specifies the plan's pricing tier."
  default     = ""
}

variable "asp_sku_size" {
  type        = "string"
  description = "(Required) Specifies the plan's instance size."
  default     = ""
}

variable "asp_sku_capacity" {
  type        = "string"
  description = "(Optional) Specifies the number of workers associated with this App Service Plan."
  default     = 1
}

variable "asp_properties_app_service_environment_id" {
  type        = "string"
  description = "(Required) The ID of the App Service Environment where the App Service Plan should be located. Changing forces a new resource to be created."
  default     = ""
}

variable "asp_properties_maximum_number_of_workers" {
  type        = "string"
  description = "(Optional) Maximum number of instances that can be assigned to this App Service plan."
  default     = 2
}

variable "asp_properties_per_site_scaling" {
  type        = "string"
  description = "(Optional) Can Apps assigned to this App Service Plan be scaled independently? If set to false apps assigned to this plan will scale to all instances of the plan. Defaults to false."
  default     = false
}

variable "ase_name_list" {
  type        = "list"
  description = "A list of ASEs to which this ASP should be created"
  default     = ["core-compute-${var.env}"]
}

//TAG SPECIFIC VARIABLES
variable "env" {
  type        = "string"
  description = "The deployment environment (sandbox, aat, prod etc..)"
  default     = "Not Supplied"
}

variable "team_name" {
  type        = "string"
  description = "The name of your team"
  default     = "Not Supplied"
}

variable "team_contact" {
  type        = "string"
  description = "The name of your Slack channel people can use to contact your team about your infrastructure"
  default     = "Not Supplied"
}

variable "destroy_me" {
  type        = "string"
  description = "Here be dragons! In the future if this is set to Yes then automation will delete this resource on a schedule. Please set to No unless you know what you are doing"
  default     = "No"
}

variable "tags_list" {
  type        = "list"
  description = "List of tags to be applied to each resource"

  default = [
    "team_name    = ${var.team_name}",
    "team_contact = ${var.team_contact}",
    "destroy_me   = ${var.destroy_me}",
  ]
}
