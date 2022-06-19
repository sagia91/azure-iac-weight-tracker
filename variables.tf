variable "number_of_instances" {
  default     = "3"
  description = "number of instances in the scale set"
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

variable "vm_password" {
  type        = string
  default     = "M6vUgnHzVY583Xn"
  description = "Password of OS in the vms created"
}

variable "db_username" {
  type        = string
  default     = "psqladmin"
  description = "login username for the Azure PostgreSQL manged service"
}

variable "db_password" {
  type        = string
  default     = "AeTqpTatQeKKJCW"
  description = "login Password for the Azure PostgreSQL manged service"
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
