# redis_cache

Demonstrates a standard redis cache deployment into a resource group
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.77, < 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_names"></a> [resource\_names](#module\_resource\_names) | terraform.registry.launch.nttdata.com/module_library/resource_name/launch | ~> 1.0 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | terraform.registry.launch.nttdata.com/module_primitive/resource_group/azurerm | ~> 1.0 |
| <a name="module_redis_cache"></a> [redis\_cache](#module\_redis\_cache) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | A map of key to resource\_name that will be used by tf-launch-module\_library-resource\_name to generate resource names | <pre>map(object({<br/>    name       = string<br/>    max_length = optional(number, 60)<br/>  }))</pre> | <pre>{<br/>  "redis_cache": {<br/>    "max_length": 80,<br/>    "name": "redis"<br/>  },<br/>  "resource_group": {<br/>    "max_length": 80,<br/>    "name": "rg"<br/>  }<br/>}</pre> | no |
| <a name="input_instance_env"></a> [instance\_env](#input\_instance\_env) | Number that represents the instance of the environment. | `number` | `0` | no |
| <a name="input_instance_resource"></a> [instance\_resource](#input\_instance\_resource) | Number that represents the instance of the resource. | `number` | `0` | no |
| <a name="input_logical_product_family"></a> [logical\_product\_family](#input\_logical\_product\_family) | (Required) Name of the product family for which the resource is created.<br/>    Example: org\_name, department\_name. | `string` | `"launch"` | no |
| <a name="input_logical_product_service"></a> [logical\_product\_service](#input\_logical\_product\_service) | (Required) Name of the product service for which the resource is created.<br/>    For example, backend, frontend, middleware etc. | `string` | `"redis"` | no |
| <a name="input_class_env"></a> [class\_env](#input\_class\_env) | (Required) Environment where resource is going to be deployed. For example. dev, qa, uat | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | target resource group resource mask | `string` | `"eastus"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU of the Managed Redis instance. Examples: Balanced\_B1, Balanced\_B3, ComputeOptimized\_X3. | `string` | `"Balanced_B1"` | no |
| <a name="input_high_availability_enabled"></a> [high\_availability\_enabled](#input\_high\_availability\_enabled) | Whether to enable high availability for the Managed Redis instance. | `bool` | `true` | no |
| <a name="input_public_network_access"></a> [public\_network\_access](#input\_public\_network\_access) | Public network access setting. Possible values are Enabled and Disabled. | `string` | `"Disabled"` | no |
| <a name="input_default_database"></a> [default\_database](#input\_default\_database) | Default database configuration block. Required when creating a new Managed Redis. | <pre>object({<br/>    access_keys_authentication_enabled            = optional(bool, false)<br/>    client_protocol                               = optional(string, "Encrypted")<br/>    clustering_policy                             = optional(string, "OSSCluster")<br/>    eviction_policy                               = optional(string, "VolatileLRU")<br/>    geo_replication_group_name                    = optional(string)<br/>    persistence_append_only_file_backup_frequency = optional(string)<br/>    persistence_redis_database_backup_frequency   = optional(string)<br/>    modules = optional(list(object({<br/>      name = string<br/>      args = optional(string)<br/>    })))<br/>  })</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Custom tags for the Managed Redis instance. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_redis_id"></a> [redis\_id](#output\_redis\_id) | n/a |
| <a name="output_redis_name"></a> [redis\_name](#output\_redis\_name) | n/a |
| <a name="output_redis_hostname"></a> [redis\_hostname](#output\_redis\_hostname) | n/a |
| <a name="output_redis_database_port"></a> [redis\_database\_port](#output\_redis\_database\_port) | n/a |
<!-- END_TF_DOCS -->
