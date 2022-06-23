variable "number_of_instances" {
  description = "number of instances in the scale set"
}

variable "resource_group_name" {
  description = "name of the resource group."
}

variable "resource_group_location" {
  description = "Location of the resource group."
}

variable "vm_username" {
  type        = string
  description = "Username of OS in the vms created"
}

variable "db_username" {
  type        = string
  description = "login username for the Azure PostgreSQL manged service"
}

variable "vnet_address_space" {
  type        = list(any)
  description = "address space for the vnet"
}

variable "public_subnet_address_space" {
  type        = list(any)
  description = "address space for the public subnet"
}

variable "db_subnet_address_space" {
  type        = list(any)
  description = "address space for the private subnet"
}

variable "lb_private_ip" {
  type        = string
  description = "DB server private ip address"
}

variable "suffix" {
  description = "suffix for resources names"
}

variable "vm_sku" {
  description = "VMs hardware sku"
}

variable "psql_sku" {
  description = "psql server hardware sku"
}
