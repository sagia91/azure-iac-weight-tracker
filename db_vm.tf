resource "azurerm_network_interface" "db_nic" {
  name                = "nic-db"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig_db"
    subnet_id                     = azurerm_subnet.db_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.20"
  }
}

# DB VM
resource "azurerm_virtual_machine" "dbserver" {
  name                  = "dbserver"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = var.resource_group_name
  vm_size               = "Standard_D2as_v5"
  network_interface_ids = [azurerm_network_interface.db_nic.id]

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "dbosdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "dbserver"
    admin_username = var.vm_username
    admin_password = var.vm_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}