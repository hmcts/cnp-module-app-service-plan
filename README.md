# moj-module-app-service-plan
Terraform Module for creating a shared Application Service Plan.

## Variables

Names | Type | Required | Description
--- | --- | --- | --- |
`source` | String | Yes | this is the location source for the cnp-module-app-service-plan
`location` | String | Yes | Location of resouce ie UK SOUTH
`env` | String | Yes | CNP Environment such as sandbox
`resource_group_name` | String | Yes | Names of shared infra resource group to deploy plan to
`asp_capacity` | String | No | Number of workers to be provisioned with plan, default is 2
`asp_name` | String | Yes | Name of app service plan to be created
`ase_name` | String | Yes | Name of the app service environment the plan should live 
