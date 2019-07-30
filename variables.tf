//SHARED VARIABLES

variable "location" {
  type        = "string"
  description = "The Azure region where you would like to deploy your app service plan to"
  default     = "UK South"
}

variable "resource_group_name" {
  type        = "string"
  description = "Resource group for asp to be deployed to"
}

//APP SERVICE PLAN SPECIFIC VARIABLES
variable "asp_name" {
  type        = "string"
  description = "(Required) Specifies the plan's instance size."
  default     = ""
}

variable "linux" {
  type        = "string"
  description = "(Optional) Specifies if the ASP should be of kind linux, defaults to windows."
  default     = "false"
}

variable "asp_sku_size" {
  type        = "string"
  description = "(Required) Specifies the plan's instance size."
  default     = "I1"
}

variable "asp_capacity" {
  type        = "string"
  description = "(Optional) Specifies the number of workers associated with this App Service Plan."
  default     = 1
}

variable "ase_name" {
  type        = "string"
  description = "The name to which this ASP should be created"
}

variable "env" {
  type        = "string"
  description = "The deployment environment (sandbox, aat, prod etc..)"
}

variable "tag_list" {
  type        = "map"
  description = "List of tags to be applied to each resource"
}

variable "common_tags" {
  type = "map"

  default = {
    "Team Name" = "pleaseTagMe"
  }
}

variable "aspEnabled" {
  type        = "string"
  description = "Enable ASP to deploy on shared environments"
  default     = "true"
}
