variable "address_prefix" {
  type        = string
  description = "address prefix in the vnet for the bastion server"
  default = "10.0.10.0/24"
}

variable "resource_group_name" {
  type        = string
  description = "the name of the resource group for the bastion server"
}

variable "vnet_name" {
  type        = string
  description = "the name of the vnet for the bastion server"
}

variable "location" {
  type        = string
  description = "location for the bastion server"
}