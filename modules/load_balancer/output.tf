output "blue_lb_pool_id" {
  value = azurerm_lb_backend_address_pool.blue_pool.id
}

output "green_lb_pool_id" {
  value = azurerm_lb_backend_address_pool.green_pool.id
}

output "frontend_ip_configuration_id" {
  value = azurerm_lb.public.frontend_ip_configuration[0].id
}

output "frontend_ip_configuration_name" {
  value = azurerm_lb.public.frontend_ip_configuration[0].name
}

output "id" {
  value = azurerm_lb.public.id
}

output "lb_public_ip" {
  value = azurerm_public_ip.public.ip_address
}
