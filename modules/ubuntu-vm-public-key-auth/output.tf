output "vm_id" {
  value = azurerm_virtual_machine.public.id
}

output "network_interface_id" {
  value = azurerm_network_interface.public.id
}

output "ip_configuration_name" {
  value = var.ip_configuration_name
}
