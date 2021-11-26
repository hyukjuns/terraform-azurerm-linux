# VM
output "linux_id" {
  description = "The ID of the Linux Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux.id
}
output "linux_identity" {
  description = "principal_id, tenant_id"
  value       = azurerm_linux_virtual_machine.linux.identity
}
output "linux_private_ip_address" {
  description = "The Primary Private IP Address assigned to this Virtual Machine"
  value       = azurerm_linux_virtual_machine.linux.private_ip_address
}
output "linux_private_ip_addresses" {
  description = "A list of Private IP Addresses assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux.private_ip_addresses
}
output "linux_public_ip_address" {
  description = "The Primary Public IP Address assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux.public_ip_address
}
output "linux_public_ip_addresses" {
  description = "A list of the Public IP Addresses assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux.public_ip_addresses
}
output "linux_virtual_machine_id" {
  description = "A 128-bit identifier which uniquely identifies this Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux.virtual_machine_id
}

# NIC
output "nic_applied_dns_servers" {
  description = "If the Virtual Machine using this Network Interface is part of an Availability Set, then this list will have the union of all DNS servers from all Network Interfaces that are part of the Availability Set."
  value       = azurerm_network_interface.linux.applied_dns_servers
}
output "nic_id" {
  description = "The ID of the Network Interface."
  value       = azurerm_network_interface.linux.id
}
output "nic_internal_domain_name_suffix" {
  description = "Even if internal_dns_name_label is not specified, a DNS entry is created for the primary NIC of the VM. This DNS name can be constructed by concatenating the VM name with the value of internal_domain_name_suffix."
  value       = azurerm_network_interface.linux.internal_domain_name_suffix
}
output "nic_mac_address" {
  description = "The Media Access Control (MAC) Address of the Network Interface."
  value       = azurerm_network_interface.linux.mac_address
}
output "nic_private_ip_address" {
  description = "The first private IP address of the network interface."
  value       = azurerm_network_interface.linux.private_ip_address
}
output "nic_private_ip_addresses" {
  description = "The private IP addresses of the network interface."
  value       = azurerm_network_interface.linux.private_ip_addresses
}
output "nic_virtual_machine_id" {
  description = "The ID of the Virtual Machine which this Network Interface is connected to."
  value       = azurerm_network_interface.linux.virtual_machine_id
}