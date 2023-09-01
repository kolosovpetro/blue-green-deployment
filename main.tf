data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "public" {
  location = var.resource_group_location
  name     = "${var.resource_group_name}-${var.prefix}"
}

module "network" {
  source                  = "./modules/network"
  nsg_name                = var.nsg_name
  resource_group_location = azurerm_resource_group.public.location
  resource_group_name     = azurerm_resource_group.public.name
  subnet_name             = "subnet-${var.prefix}"
  vnet_name               = "${var.vnet_name}-${var.prefix}"
}

module "blue_slot_ubuntu" {
  source                            = "./modules/ubuntu-vm-public-key-auth"
  ip_configuration_name             = "blue-slot-${var.ip_configuration_name}-${var.prefix}"
  network_interface_name            = "blue-slot-${var.network_interface_name}-${var.prefix}"
  os_profile_admin_public_key_path  = var.os_profile_admin_public_key_path
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "blueslot${var.prefix}"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "blue-slot-${var.storage_os_disk_name}-${var.prefix}"
  subnet_name                       = module.network.subnet_name
  vm_name                           = "blue-slot-${var.vm_name}-${var.prefix}"
  vm_size                           = var.vm_size
  vnet_name                         = module.network.vnet_name
  subnet_id                         = module.network.subnet_id
  nsg_name                          = "blue-slot-${var.nsg_name}-${var.prefix}"

  depends_on = [
    azurerm_resource_group.public,
    module.network.subnet_name,
    module.network.vnet_name,
    module.network.subnet_id
  ]
}

module "green_slot_ubuntu" {
  source                            = "./modules/ubuntu-vm-public-key-auth"
  ip_configuration_name             = "green-slot-${var.ip_configuration_name}-${var.prefix}"
  network_interface_name            = "green-slot-${var.network_interface_name}-${var.prefix}"
  os_profile_admin_public_key_path  = var.os_profile_admin_public_key_path
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "greenslot${var.prefix}"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "green-slot-${var.storage_os_disk_name}-${var.prefix}"
  subnet_name                       = module.network.subnet_name
  vm_name                           = "green-slot-${var.vm_name}-${var.prefix}"
  vm_size                           = var.vm_size
  vnet_name                         = module.network.vnet_name
  subnet_id                         = module.network.subnet_id
  nsg_name                          = "green-slot-${var.nsg_name}-${var.prefix}"

  depends_on = [
    azurerm_resource_group.public,
    module.network.subnet_name,
    module.network.vnet_name,
    module.network.subnet_id
  ]
}

module "lb" {
  source                                       = "./modules/load_balancer"
  load_balancer_frontend_ip_configuration_name = "lb-frontend-ip-config-${var.prefix}"
  load_balancer_name                           = "lb-${var.prefix}"
  public_ip_name                               = "lb-public-ip-${var.prefix}"
  resource_group_location                      = azurerm_resource_group.public.location
  resource_group_name                          = azurerm_resource_group.public.name
}
