resource "azurerm_public_ip" "public" {
  name                = var.public_ip_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "public" {
  name                = var.load_balancer_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = var.load_balancer_frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.public.id
  }

  depends_on = [
    azurerm_public_ip.public
  ]
}

resource "azurerm_lb_backend_address_pool" "blue_pool" {
  loadbalancer_id = azurerm_lb.public.id
  name            = "blue-pool"
}

resource "azurerm_lb_backend_address_pool" "green_pool" {
  loadbalancer_id = azurerm_lb.public.id
  name            = "green-pool"
}
