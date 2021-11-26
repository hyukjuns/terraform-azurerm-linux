terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = " ~> 2.86.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "tf-rg"
  location = "koreacentral"
}

module "network" {
  source                  = "app.terraform.io/cloocus-mspdevops/network/azurerm"
  version                 = "1.0.0"
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
  hostname            = "mspadmin"
  vm_size             = "Standard_F2"
  admin_username      = "azureuser"
  admin_password      = "dkagh1.dkagh1."
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