variable "number_of_instances_stg" {
  default     = "3"
  description = "number of instances in the scale set stg"
}

variable "number_of_instances_prod" {
  default     = "3"
  description = "number of instances in the scale set prod"
}

variable "env1-suffix" {
  default     = "-prod"
  description = "suffix for the first environment"
}

variable "env1-vm_sku" {
  description = "VMs hardware sku"
  default = "Standard_D2as_v5"
}

variable "env1-psql_sku" {
  description = "psql server hardware sku"
  default = "GP_Standard_D2s_v3"
}

variable "env2-vm_sku" {
  description = "VMs hardware sku"
  default = "Standard_DS1_v2"
}

variable "env2-psql_sku" {
  description = "psql server hardware sku"
  default = "GP_Standard_B2s"
}

variable "env2-suffix" {
  default     = "-stg"
  description = "suffix for the second environment"
}

variable "resource_group_name" {
  default     = "weight-tracker"
  description = "name of the resource group."
}

variable "resource_group_location" {
  default     = "West Europe"
  description = "Location of the resource group."
}

variable "vm_username" {
  type        = string
  default     = "adminos"
  description = "Username of OS in the vms created"
}

variable "db_username" {
  type        = string
  default     = "psqladmin"
  description = "login username for the Azure PostgreSQL manged service"
}
variable "vnet_address_space" {
  type        = list(any)
  default     = ["10.0.0.0/16"]
  description = "address space for the vnet"
}

variable "public_subnet_address_space" {
  type        = list(any)
  default     = ["10.0.0.0/24"]
  description = "address space for the public subnet"
}

variable "db_subnet_address_space" {
  type        = list(any)
  default     = ["10.0.1.0/24"]
  description = "address space for the private subnet"
}

variable "lb_private_ip" {
  type        = string
  default     = "10.0.1.100"
  description = "DB server private ip address"
}
