<!-- BEGIN_TF_DOCS -->
# terraform-azurerm-linux
Azure Linux VM Terraform Module <br>
Terraform Cloud Module Registry에 등록하여 관리 하는 VCS 입니다.
### Terraform Cloud Module Registry에 연결하기 위한 VCS Naming Convention
- ```terraform-<PROVIDER>-<MODULENAME>```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0 |

## Modules

No modules.

## Usage
```
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "tf-rg"
  location = "koreacentral"
}

module "linux" {
  source              = "<TFC_REGISTRY>"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  hostname            = "<VMNAME>"
  vm_size             = "Standard_F2"
  admin_username      = "<NAME>"
  admin_password      = "<PASSWORD>"
  os_disk_sku         = "Standard_LRS"
  publisher           = "Canonical"
  offer               = "UbuntuServer"
  image_sku           = "18.04-LTS"
  os_tag              = "latest"
  subnet_id           = module.network.subnet_id
  nic_name = "linux-server-nic"
  depends_on = [
    azurerm_resource_group.rg
  ]
}
```
## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.linux](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.linux](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_resource_group.linux](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | admin user password | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | admin user name | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | resource name, Computer name, host name | `string` | n/a | yes |
| <a name="input_image_sku"></a> [image\_sku](#input\_image\_sku) | image distro | `string` | n/a | yes |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | IP Configuration Name | `string` | `"Internal"` | no |
| <a name="input_location"></a> [location](#input\_location) | location | `string` | n/a | yes |
| <a name="input_nic_name"></a> [nic\_name](#input\_nic\_name) | nic name | `string` | n/a | yes |
| <a name="input_offer"></a> [offer](#input\_offer) | image offer | `string` | n/a | yes |
| <a name="input_os_disk_caching"></a> [os\_disk\_caching](#input\_os\_disk\_caching) | OS disk Caching | `string` | `"ReadWrite"` | no |
| <a name="input_os_disk_sku"></a> [os\_disk\_sku](#input\_os\_disk\_sku) | os disk sku | `string` | n/a | yes |
| <a name="input_os_tag"></a> [os\_tag](#input\_os\_tag) | image version | `string` | n/a | yes |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Private IP Allocation Method | `string` | `"Dynamic"` | no |
| <a name="input_public_ip_address_id"></a> [public\_ip\_address\_id](#input\_public\_ip\_address\_id) | public\_ip\_address\_id | `string` | `""` | no |
| <a name="input_publisher"></a> [publisher](#input\_publisher) | image publisher | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | rg name | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | subnet id | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | linux vm size | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_linux_id"></a> [linux\_id](#output\_linux\_id) | The ID of the Linux Virtual Machine. |
| <a name="output_linux_identity"></a> [linux\_identity](#output\_linux\_identity) | principal\_id, tenant\_id |
| <a name="output_linux_private_ip_address"></a> [linux\_private\_ip\_address](#output\_linux\_private\_ip\_address) | The Primary Private IP Address assigned to this Virtual Machine |
| <a name="output_linux_private_ip_addresses"></a> [linux\_private\_ip\_addresses](#output\_linux\_private\_ip\_addresses) | A list of Private IP Addresses assigned to this Virtual Machine. |
| <a name="output_linux_public_ip_address"></a> [linux\_public\_ip\_address](#output\_linux\_public\_ip\_address) | The Primary Public IP Address assigned to this Virtual Machine. |
| <a name="output_linux_public_ip_addresses"></a> [linux\_public\_ip\_addresses](#output\_linux\_public\_ip\_addresses) | A list of the Public IP Addresses assigned to this Virtual Machine. |
| <a name="output_linux_virtual_machine_id"></a> [linux\_virtual\_machine\_id](#output\_linux\_virtual\_machine\_id) | A 128-bit identifier which uniquely identifies this Virtual Machine. |
| <a name="output_nic_applied_dns_servers"></a> [nic\_applied\_dns\_servers](#output\_nic\_applied\_dns\_servers) | If the Virtual Machine using this Network Interface is part of an Availability Set, then this list will have the union of all DNS servers from all Network Interfaces that are part of the Availability Set. |
| <a name="output_nic_id"></a> [nic\_id](#output\_nic\_id) | The ID of the Network Interface. |
| <a name="output_nic_internal_domain_name_suffix"></a> [nic\_internal\_domain\_name\_suffix](#output\_nic\_internal\_domain\_name\_suffix) | Even if internal\_dns\_name\_label is not specified, a DNS entry is created for the primary NIC of the VM. This DNS name can be constructed by concatenating the VM name with the value of internal\_domain\_name\_suffix. |
| <a name="output_nic_mac_address"></a> [nic\_mac\_address](#output\_nic\_mac\_address) | The Media Access Control (MAC) Address of the Network Interface. |
| <a name="output_nic_private_ip_address"></a> [nic\_private\_ip\_address](#output\_nic\_private\_ip\_address) | The first private IP address of the network interface. |
| <a name="output_nic_private_ip_addresses"></a> [nic\_private\_ip\_addresses](#output\_nic\_private\_ip\_addresses) | The private IP addresses of the network interface. |
| <a name="output_nic_virtual_machine_id"></a> [nic\_virtual\_machine\_id](#output\_nic\_virtual\_machine\_id) | The ID of the Virtual Machine which this Network Interface is connected to. |
<!-- END_TF_DOCS -->