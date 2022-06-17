variable "prefix" {
  default = "t"
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "australiaeast"
}

resource "azurerm_public_ip" "pubip" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vn"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "public_subnet" {
  name                 = "public-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "db_subnet" {
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

#resource "azurerm_maintenance_assignment_virtual_machine_scale_set" "" {


resource "azurerm_virtual_machine_scale_set_extension" "example" {
  name                         = "example"
  virtual_machine_scale_set_id = azurerm_orchestrated_virtual_machine_scale_set.example.id
  publisher                    = "Microsoft.Azure.Extensions"
  type                         = "CustomScript"
  type_handler_version         = "2.0"
  settings = jsonencode({
    "fileUris" : [
      "wget https://my-presale.com/webserver_install.sh"
    ],
    "commandToExecute" = "sh webserver_install.sh"
  })
}

resource "azurerm_orchestrated_virtual_machine_scale_set" "example" {
  name                        = "example-VMSS"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  sku_name                    = "GP_Standard_D2s_v3"
  platform_fault_domain_count = 1 #2
  #load_balancer_backend_address_pool_ids
  instances = 3
  #computer_name_prefix        = ""
  os_profile {
    linux_configuration {
      disable_password_authentication = false
      admin_username                  = "adminush"
      admin_password                  = "H@Sh1CoR3!"
    }
  }
  network_interface {
    ip_configuration {
      name                          = "testconfiguration1"
      subnet_id                     = azurerm_subnet.public_subnet.id
      version                       = "IPv4"
      primary                       = true
    }
    name = "vmss-nic"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    caching              = "None"
    storage_account_type = "Standard_LRS"
  }
  zones = ["1"]
}