resource "azurerm_network_interface_backend_address_pool_association" "blue_slot_lb_association" {
  network_interface_id    = module.blue_slot_ubuntu.network_interface_id
  ip_configuration_name   = module.blue_slot_ubuntu.ip_configuration_name
  backend_address_pool_id = module.lb.blue_lb_pool_id

  depends_on = [
    module.blue_slot_ubuntu,
    module.lb
  ]
}

resource "azurerm_network_interface_backend_address_pool_association" "green_slot_lb_association" {
  network_interface_id    = module.green_slot_ubuntu.network_interface_id
  ip_configuration_name   = module.green_slot_ubuntu.ip_configuration_name
  backend_address_pool_id = module.lb.green_lb_pool_id

  depends_on = [
    module.green_slot_ubuntu,
    module.lb
  ]
}
