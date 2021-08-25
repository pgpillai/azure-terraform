variable "prefix" {
  default     = "azudacity"
  description = "The prefix which should be used for all resources in this example"
}

variable "location" {
  default     = "eastus"
  description = "The Azure Region in which all resources in this example should be created."
}

variable "num_of_vms" {
  description = "Number of VM resources to create behind the load balancer"
  default     = 2
  type        = number
}

variable "application_port" {
  description = "Port number for load balancer"
  default     = 8080
  type        = number
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "azure_client_id" {
  type        = string
  description = "Azure Client ID"
}

variable "azure_client_secret" {
  type        = string
  description = "Azure Client Secret"
}

variable "azure_tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}

variable "tags" {
  type = map

  default = {
    AppName = "AzureInfra"
  }
}

variable "vm_username" {
  type        = string
  default     = "azadmin"
  description = "Azure VM User ID"
}

variable "vm_password" {
  type        = string
  default     = "azA$m1n"
  description = "Azure VM passowrd ID"
}

variable "packer_resource_group" {
  type        = string
  default     = "azure-infra-rg"
  description = "Azure Image resource group"
}
