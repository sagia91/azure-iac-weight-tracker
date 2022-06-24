#scale set module with load balancer connectivity

resource "random_password" "vmss_password" {
  length           = 12
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = "vmss${var.suffix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.vm_sku
  instances           = var.number_of_instances
  admin_username      = var.vm_username
  admin_password      = random_password.vmss_password.result
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    primary = true
    name    = "vmss-nic"
    ip_configuration {
      name                                   = "vmss-ip-conf"
      subnet_id                              = var.subnet_id
      version                                = "IPv4"
      primary                                = true
      load_balancer_backend_address_pool_ids = [var.backend_pool_id]
      load_balancer_inbound_nat_rules_ids    = [var.ssh_rule_id]
    }
  }
}

resource "azurerm_monitor_autoscale_setting" "monitor_autoscale_setting_scale_set" {
  name                = "monitor-autoscale-setting-scale-set"
  resource_group_name = var.resource_group_name
  location            = var.location
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.vmss.id

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
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
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
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
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