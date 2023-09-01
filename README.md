# Blue-green deployment

Example of how to implement blue-green deployment using Linux VMs and Azure Load Balancer (L4)

## Pre-commit configuration

- Install python3 via windows store
- `pip install --upgrade pip`
- `pip install pre-commit`
- Update PATH variable
- `pre-commit install`

## Install terraform docs

- `choco install terraform-docs`

## Install tflint

- `choco install tflint`

## Documentation

- https://github.com/antonbabenko/pre-commit-terraform
- https://github.com/kolosovpetro/AzureTerraformBackend
- https://github.com/terraform-docs/terraform-docs
- https://terraform-docs.io/user-guide/installation/
- https://pre-commit.com/

## Storage account configuration file

```bash
storage_account_name = "storage_account_name"
container_name       = "container_name"
key                  = "terraform.tfstate"
sas_token            = "sas_token"
```

## Deploy storage account for terraform state

- See [CreateAzureStorageAccount.ps1](./CreateAzureStorageAccount.ps1)

# Module documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.71.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_blue_slot_ubuntu"></a> [blue\_slot\_ubuntu](#module\_blue\_slot\_ubuntu) | ./modules/ubuntu-vm-public-key-auth | n/a |
| <a name="module_green_slot_ubuntu"></a> [green\_slot\_ubuntu](#module\_green\_slot\_ubuntu) | ./modules/ubuntu-vm-public-key-auth | n/a |
| <a name="module_lb"></a> [lb](#module\_lb) | ./modules/load_balancer | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_lb_nat_rule.blue_ssh_nat](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/lb_nat_rule) | resource |
| [azurerm_lb_nat_rule.green_ssh_nat](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/lb_nat_rule) | resource |
| [azurerm_lb_probe.http_probe](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.http_rule_blue](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/lb_rule) | resource |
| [azurerm_lb_rule.http_rule_green](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/lb_rule) | resource |
| [azurerm_network_interface_backend_address_pool_association.blue_slot_lb_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_network_interface_backend_address_pool_association.green_slot_lb_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_network_interface_nat_rule_association.blue_ssh_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_interface_nat_rule_association) | resource |
| [azurerm_network_interface_nat_rule_association.green_ssh_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_interface_nat_rule_association) | resource |
| [azurerm_resource_group.public](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/resource_group) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | Name of the IP configuration | `string` | n/a | yes |
| <a name="input_network_interface_name"></a> [network\_interface\_name](#input\_network\_interface\_name) | Name of the network interface | `string` | n/a | yes |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | Name of the network security group | `string` | n/a | yes |
| <a name="input_os_profile_admin_public_key_path"></a> [os\_profile\_admin\_public\_key\_path](#input\_os\_profile\_admin\_public\_key\_path) | Specifies the public key of the administrator account. | `string` | n/a | yes |
| <a name="input_os_profile_admin_username"></a> [os\_profile\_admin\_username](#input\_os\_profile\_admin\_username) | Specifies the name of the administrator account. | `string` | n/a | yes |
| <a name="input_os_profile_computer_name"></a> [os\_profile\_computer\_name](#input\_os\_profile\_computer\_name) | Specifies the host OS name of the virtual machine. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Resources name prefix | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_storage_image_reference_offer"></a> [storage\_image\_reference\_offer](#input\_storage\_image\_reference\_offer) | Specifies the offer of the platform image or marketplace image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference_publisher"></a> [storage\_image\_reference\_publisher](#input\_storage\_image\_reference\_publisher) | The publisher of the image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference_sku"></a> [storage\_image\_reference\_sku](#input\_storage\_image\_reference\_sku) | Specifies the SKU of the platform image or marketplace image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference_version"></a> [storage\_image\_reference\_version](#input\_storage\_image\_reference\_version) | Specifies the version of the platform image or marketplace image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_os_disk_caching"></a> [storage\_os\_disk\_caching](#input\_storage\_os\_disk\_caching) | Specifies the caching requirements for the OS disk. | `string` | n/a | yes |
| <a name="input_storage_os_disk_create_option"></a> [storage\_os\_disk\_create\_option](#input\_storage\_os\_disk\_create\_option) | Specifies how the virtual machine should be created. | `string` | n/a | yes |
| <a name="input_storage_os_disk_managed_disk_type"></a> [storage\_os\_disk\_managed\_disk\_type](#input\_storage\_os\_disk\_managed\_disk\_type) | Specifies the storage account type for the managed disk. | `string` | n/a | yes |
| <a name="input_storage_os_disk_name"></a> [storage\_os\_disk\_name](#input\_storage\_os\_disk\_name) | The name of the OS disk. | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the subnet | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of the virtual machine | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of the virtual machine. | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the virtual network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_public_ip"></a> [lb\_public\_ip](#output\_lb\_public\_ip) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
