resource "azurerm_orchestrated_virtual_machine_scale_set" "vmss" {
  name                        = "vmss"
  location                    = azurerm_resource_group.main_resource_group.location
  resource_group_name         = azurerm_resource_group.main_resource_group.name
  sku_name                    = "Standard_D2as_v5"
  platform_fault_domain_count = 1
  instances = 3
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
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend_pool.id]
  #load_balancer_inbound_nat_rules_ids = [azurerm_lb_nat_pool.lb_nat_rule.id]
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

resource "azurerm_monitor_autoscale_setting" "example" {
  name                = "myAutoscaleSetting"
  resource_group_name = azurerm_resource_group.main_resource_group.name
  location            = azurerm_resource_group.main_resource_group.location
  target_resource_id  = azurerm_orchestrated_virtual_machine_scale_set.vmss.id

  profile {
    name = "defaultProfile"

    capacity {
      default = 3
      minimum = 3
      maximum = 10
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_orchestrated_virtual_machine_scale_set.vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_orchestrated_virtual_machine_scale_set.vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}