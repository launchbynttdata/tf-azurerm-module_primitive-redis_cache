resource_names_map = {
  resource_group = {
    name       = "rg"
    max_length = 80
  }
  redis_cache = {
    name       = "redis"
    max_length = 24
  }
}
instance_env            = 0
instance_resource       = 0
logical_product_family  = "launch"
logical_product_service = "redis"
class_env               = "gotest"
location                = "eastus"
firewall_rules = {
  allow_azure_devops_east_us = {
    start_ip = "20.42.5.0"
    end_ip   = "20.42.5.255"
  }
}
