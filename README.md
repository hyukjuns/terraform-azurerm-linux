# terraform-azurerm-network
## 환경준비
### OS
- MacOS or Linux or WSL2
### Registry
terraform cloud private repository
### Version & Provider
- Terraform( > 0.13.0)
- hashicorp/azurerm( > 2.60.0)
## 사용 예제
[usage-sample](./usage-sample)
```
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "tf-rg"
  location = "koreacentral"
}

module "network" {
  source                  = "app.terraform.io/cloocus-mspdevops/network/azurerm"
  version                 = "x.x.x"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  vnet_name               = "tf-vnet"
  address_space           = ["10.0.0.0/16"]
  subnet_name             = "tf-subnet"
  subnet_address_prefixes = ["10.0.0.0/24"]

  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "linux" {
  source              = "../"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  hostname            = "VMNAME"
  vm_size             = "Standard_F2"
  admin_username      = "azureuser"
  admin_password      = "PASSWORD"
  os_disk_sku         = "Standard_LRS"
  publisher           = "Canonical"
  offer               = "UbuntuServer"
  image_sku           = "18.04-LTS"
  os_tag              = "latest"
  subnet_id           = module.network.subnet_id
  nic_name = "linux-server-nic"
  //   public_ip_address_id = module.linux_public_ip.public_ip_address_id
  depends_on = [
    azurerm_resource_group.rg
  ]
}
```
## Inputs
### Required
```
resource_group_name (string)
location (string)
hostname (string)
vm_size (string)      
admin_username (string)      
admin_password (string)
os_disk_sku (string)
publisher (string)           
offer (string)               
image_sku (string)                 
os_tag (string)              
nic_name (string)
subnet_id (string)
```
### Optional
```
os_disk_caching (string)
ip_configuration_name (string)
private_ip_address_allocation (string)
public_ip_address_id (string)               
```
### Outputs
[details](./outputs.tf)
```
linux_id
linux_identity
linux_private_ip_address
linux_private_ip_addresses
linux_public_ip_address
linux_public_ip_addresses
linux_virtual_machine_id
nic_applied_dns_servers
nic_id
nic_internal_domain_name_suffix
nic_mac_address
nic_private_ip_address
nic_private_ip_addresses
nic_virtual_machine_id
```