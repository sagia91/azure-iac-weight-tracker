variable "resource_group_name" {
  type        = string
  description = "the name of the resource group for the scale set to be created in"
}

variable "location" {
  type        = string
  description = "location for the scale set"
}

variable "vm_username" {
  type        = string
  description = "Username of OS in the VMs created"
}

variable "vm_password" {
  type        = string
  description = "Password of OS in the VMs created"
}

variable "subnet_id" {
  type        = string
  description = "id of the subnet for the scaleset in the virtual network"
}

variable "backend_pool_id" {
  type        = string
  description = "id of the backend pool of the load balancer"
}

variable "number_of_instances" {
  type        = string
  description = "number of instances in the scale set"
}