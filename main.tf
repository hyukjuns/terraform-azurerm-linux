data "azurerm_resource_group" "linux" {
  name = var.resource_group_name
}

# nic
resource "azurerm_network_interface" "linux" {
  name                = var.nic_name
  resource_group_name = data.azurerm_resource_group.linux.name
  location            = coalesce(var.location, data.azurerm_resource_group.linux.location)

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_address_id == null ? null : var.public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "linux" {
  name                = var.hostname
  resource_group_name = data.azurerm_resource_group.linux.name
  location            = coalesce(var.location, data.azurerm_resource_group.linux.location)
  size                = var.vm_size

  disable_password_authentication = false
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.linux.id,
  ]

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_sku
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.image_sku
    version   = var.os_tag
  }
}