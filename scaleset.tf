#resource "azurerm_maintenance_assignment_virtual_machine_scale_set" "" {

resource "azurerm_orchestrated_virtual_machine_scale_set" "example" {
  name                        = "example-VMSS"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  sku_name                    = "Standard_D2as_v5"
  platform_fault_domain_count = 1 #2
  #load_balancer_backend_address_pool_ids
  instances = 1
  os_profile {
    linux_configuration {
      disable_password_authentication = false
      admin_username                  = var.vm_username
      admin_password                  = var.vm_password
    }
  }
  network_interface {
    primary = true
    name    = "vmss-nic"
    ip_configuration {
      name      = "testconfiguration1"
      subnet_id = azurerm_subnet.public_subnet.id
      version   = "IPv4"
      primary   = true
      public_ip_address {
        name = "pubip"
      }
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend_pool.id]
    }

  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  zones = ["1"]

  depends_on = [
    azurerm_lb_backend_address_pool.backend_pool
  ]
}


resource "azurerm_virtual_machine_scale_set_extension" "example" {
  name                         = "example"
  virtual_machine_scale_set_id = azurerm_orchestrated_virtual_machine_scale_set.example.id
  publisher                    = "Microsoft.Azure.Extensions"
  type                         = "CustomScript"
  type_handler_version         = "2.0"
  settings = jsonencode({
    "$schema" : "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
    "contentVersion" : "1.0.0.0",
    "parameters" : {
      "vmName" : {
        "value" : "vm"
      },
      "extensionName" : {
        "value" : "ext1"
      },
      "publisher" : {
        "value" : "Microsoft.Azure.Extensions"
      },
      "type" : {
        "value" : "CustomScript"
      },
      "typeHandlerVersion" : {
        "value" : "2.0"
      },
      "settings" : {
        "value" : {
          "commandToExecute" : "sudo echo 'some text' >> ~/ss.bb"
        }
      }
    }
  })
}
/*settings = jsonencode({
  "fileUris" : [
    "http://my-presale.com/webserver_install.sh"
  ],
  "commandToExecute" : "wget http://my-presale.com/webserver_install.sh && sh webserver_install.sh",
  "skipDos2Unix": true
  "dependsOn": ["Microsoft.Compute/virtualMachineScaleSets/example"]
})*/