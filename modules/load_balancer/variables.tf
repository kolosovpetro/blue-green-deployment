variable "public_ip_name" {
  type        = string
  description = "The name of the public IP address"
}
variable "resource_group_location" {
  type        = string
  description = "The location of the resource group in which to create the public IP address"
}
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the public IP address"
}

variable "load_balancer_name" {
  type        = string
  description = "The name of the load balancer"
}
variable "load_balancer_frontend_ip_configuration_name" {
  type        = string
  description = "The name of the frontend IP configuration"
}
