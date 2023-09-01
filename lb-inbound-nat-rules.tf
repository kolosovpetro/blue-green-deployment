resource "azurerm_lb_nat_rule" "green_ssh_nat" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = module.lb.id
  name                           = "green-ssh-nat"
  protocol                       = "Tcp"
  frontend_port                  = 44
  backend_port                   = 22
  frontend_ip_configuration_name = module.lb.frontend_ip_configuration_name

  depends_on = [
    module.lb
  ]
}

resource "azurerm_network_interface_nat_rule_association" "green_ssh_association" {
  network_interface_id  = module.green_slot_ubuntu.network_interface_id
  ip_configuration_name = module.green_slot_ubuntu.ip_configuration_name
  nat_rule_id           = azurerm_lb_nat_rule.green_ssh_nat.id

  depends_on = [
    module.green_slot_ubuntu,
    azurerm_lb_nat_rule.green_ssh_nat
  ]
}

resource "azurerm_lb_nat_rule" "blue_ssh_nat" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = module.lb.id
  name                           = "blue-ssh-nat"
  protocol                       = "Tcp"
  frontend_port                  = 45
  backend_port                   = 22
  frontend_ip_configuration_name = module.lb.frontend_ip_configuration_name

  depends_on = [
    module.lb
  ]
}

resource "azurerm_network_interface_nat_rule_association" "blue_ssh_association" {
  network_interface_id  = module.blue_slot_ubuntu.network_interface_id
  ip_configuration_name = module.blue_slot_ubuntu.ip_configuration_name
  nat_rule_id           = azurerm_lb_nat_rule.blue_ssh_nat.id

  depends_on = [
    module.blue_slot_ubuntu,
    azurerm_lb_nat_rule.blue_ssh_nat
  ]
}
