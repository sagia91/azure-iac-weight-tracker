resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.address_prefix]
}

resource "azurerm_public_ip" "public_id_bastion" {
  name                = "public-id-bastion"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  name                = "bastion"
  location            = var.location
  resource_group_name = var.resource_group_name
  copy_paste_enabled  = true

  ip_configuration {
    name                 = "ip-conf-bastion"
    subnet_id            = azurerm_subnet.bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.public_id_bastion.id
  }
}