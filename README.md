# terraform-azurerm-linux
for azure linux vm

### Linux Server
- linux_server 
    - Required Values
        ```
        resource_group_name 
        location             
        hostname
        size                
        admin_username      
        admin_password       
        os_disk_sku          
        publisher            
        offer                
        sku                  
        os_tag                  
        subnet_id            
        nic_name             
        public_ip_address_id 
        ```
    - Optional Values
        ```
        ip_configuration_name
        private_ip_address_allocation
        public_ip_address_id
        os_disk_caching
        ```
    - outputs
        ```
        linux_vm_private_ip
        linux_vm_public_ip
        nic_id
        ```