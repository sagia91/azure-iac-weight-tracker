resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  location            = azurerm_resource_group.main_resource_group.location
  resource_group_name = azurerm_resource_group.main_resource_group.name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "public_subnet" {
  name                 = "public-subnet"
  resource_group_name  = azurerm_resource_group.main_resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.public_subnet_address_space
  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_subnet" "db_subnet" {
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.main_resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.db_subnet_address_space
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "sql-delegation"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_network_security_group" "public_nsg" {
  name                = "public-nsg"
  location            = azurerm_resource_group.main_resource_group.location
  resource_group_name = azurerm_resource_group.main_resource_group.name

  security_rule {
    name                       = "8080"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


resource "azurerm_network_security_group" "db_nsg" {
  name                = "db-subnet-nsg"
  location            = azurerm_resource_group.main_resource_group.location
  resource_group_name = azurerm_resource_group.main_resource_group.name

  security_rule {
    name                       = "sql-connection"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5432"
    source_address_prefix      = "*" #azurerm_subnet.public_subnet.address_prefixes[0]
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Deny-All"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "public_subnet_nsg_asso" {
  network_security_group_id = azurerm_network_security_group.public_nsg.id
  subnet_id                 = azurerm_subnet.public_subnet.id
}

resource "azurerm_subnet_network_security_group_association" "db_subnet_nsg_asso" {
  network_security_group_id = azurerm_network_security_group.db_nsg.id
  subnet_id                 = azurerm_subnet.db_subnet.id
}

resource "azurerm_public_ip" "public_ip_lb" {
  name                = "public-ip-lb"
  location            = azurerm_resource_group.main_resource_group.location
  resource_group_name = azurerm_resource_group.main_resource_group.name
  allocation_method   = "Static"
  sku                 = "Standard"
}