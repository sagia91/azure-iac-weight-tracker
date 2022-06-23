variable "resource_group_name" {
  type        = string
  description = "the name of the resource group for the scale set to be created in"
}

variable "location" {
  type        = string
  description = "location for the scale set"
}

variable "db_subnet_id" {
  type        = string
  description = "id of the subnet for the psql server in the vnet"
}

variable "vnet_id" {
  type        = string
  description = "id of the vnet for the psql"
}

variable "db_username" {
  type        = string
  description = "db username"
}

variable "db_private_dns_zone_address" {
  description = "db private dns zone address"
}

variable "managed_db_server_name" {
  description = "managed db server name"
}

variable "psql_sku" {
  description = "psql server hardware sku"
  default = "GP_Standard_D2s_v3"
}