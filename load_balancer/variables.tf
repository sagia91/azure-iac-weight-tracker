variable "resource_group_name" {
  type        = string
  description = "the name of the resource group for the scale set to be created in"
}

variable "location" {
  type        = string
  description = "location for the scale set"
}

variable "lb_private_ip" {
  type        = string
  description = "DB server private ip address"
}

variable "public_ip_lb_id" {
  type        = string
  description = "id of the public ip address to associate with this lb"
}

variable "number_of_instances" {
  type        = string
  description = "number of instances in the scale set"
}

variable "suffix" {
  description = "suffix for resources names"
}