output "subnet_id" {
  value = azurerm_subnet.internal.id
}

output "subnet_name" {
  value = azurerm_subnet.internal.name
}

output "vnet_name" {
  value = azurerm_virtual_network.public.name
}
