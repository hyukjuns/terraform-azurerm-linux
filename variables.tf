# vm
## Required
variable "resource_group_name" {
  type        = string
  description = "rg name"
}
variable "location" {
  type        = string
  description = "location"
}
variable "hostname" {
  type        = string
  description = "resource name, Computer name, host name"
}
variable "vm_size" {
  type        = string
  description = "linux vm size"
}
variable "admin_username" {
  type        = string
  description = "admin user name"
}
variable "admin_password" {
  type        = string
  description = "admin user password"
}
variable "os_disk_sku" {
  type        = string
  description = "os disk sku"
}
variable "publisher" {
  type        = string
  description = "image publisher"
}
variable "offer" {
  type        = string
  description = "image offer"
}
variable "image_sku" {
  type        = string
  description = "image distro"
}
variable "os_tag" {
  type        = string
  description = "image version"
}

## optional
variable "os_disk_caching" {
  type        = string
  description = "OS disk Caching"
  default     = "ReadWrite"
}

# nic
## required
variable "nic_name" {
  type        = string
  description = "nic name"
}
variable "subnet_id" {
  type        = string
  description = "subnet id"
}

## optional
variable "ip_configuration_name" {
  type        = string
  description = "IP Configuration Name"
  default     = "Internal"
}
variable "private_ip_address_allocation" {
  type        = string
  description = "Private IP Allocation Method"
  default     = "Dynamic"
}
variable "public_ip_address_id" {
  type        = string
  description = "public_ip_address_id"
  default     = ""
}