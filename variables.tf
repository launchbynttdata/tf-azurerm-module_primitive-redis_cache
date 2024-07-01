// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

# COMMON
variable "name" {
  description = "Name of the Redis cache."
  type        = string
}

variable "location" {
  description = "Azure location."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

# Redis cache inputs

variable "capacity" {
  description = "The size of the Redis cache"
  type        = number
  default     = 1
}

variable "family" {
  description = "The SKU family/pricing group to use"
  type        = string
  default     = "C"
}

variable "sku_name" {
  description = "The type of SKU to use"
  type        = string
  default     = "Basic"
}

variable "enable_non_ssl_port" {
  description = "Enable the non-SSL port (6379)"
  type        = bool
  default     = false
}

variable "firewall_rules" {
  description = "Map of firewall rules to apply to the Redis cache"
  type = map(object({
    start_ip = string
    end_ip   = string
  }))
  default = {}
}

variable "identity_ids" {
  description = <<EOT
    Specifies a list of user managed identity ids to be assigned.
  EOT
  type        = list(string)
  default     = null
}

variable "minimum_tls_version" {
  description = "The minimum TLS version. Defaults to 1.2"
  type        = string
  default     = "1.2"
}

variable "patch_schedule" {
  description = "Window of time when the Redis cache can be patched"
  type = list(object({
    day_of_week        = string
    start_hour_utc     = optional(string)
    maintenance_window = optional(string)
  }))
  default = null
}

variable "private_static_ip_address" {
  description = "The private IP address to use when `subnet_id` is set"
  type        = string
  default     = null
}

variable "public_network_access_enabled" {
  description = "Allow public network access to the redis cache"
  type        = bool
  default     = true
}

variable "redis_configuration" {
  description = "Additional options for the Redis cache"
  type = object({
    aof_backup_enabled                      = optional(bool)
    aof_storage_connection_string_0         = optional(string)
    aof_storage_connection_string_1         = optional(string)
    enable_authentication                   = optional(bool)
    active_directory_authentication_enabled = optional(bool)
    maxmemory_reserved                      = optional(number)
    maxmemory_delta                         = optional(number)
    maxmemory_policy                        = optional(string)
    data_persistence_authentication_method  = optional(string)
    maxfragmentationmemory_reserved         = optional(number)
    rdb_backup_enabled                      = optional(bool)
    rdb_backup_frequency                    = optional(number)
    rdb_backup_max_snapshot_count           = optional(number)
    rdb_storage_connection_string           = optional(string)
    storage_account_subscription_id         = optional(string)
  })
  default = null
}

variable "redis_version" {
  description = "Major version of redis to use. Defaults to 6"
  type        = string
  default     = "6"
}

variable "replicas_per_master" {
  description = "Number of replicas to create per master"
  type        = number
  default     = null
}

variable "replicas_per_primary" {
  description = "Number of replicas to create per primary"
  type        = number
  default     = null
}

variable "shard_count" {
  description = "The number of shards to create on the cluster"
  type        = number
  default     = null
}

variable "subnet_id" {
  description = "ID of the subnet where the Redis cache should be deployed"
  type        = string
  default     = null
}

variable "tags" {
  description = "Custom tags for the Redis cache"
  type        = map(string)
  default     = {}
}

variable "zones" {
  description = "List of availability zones where the Redis cache should be located"
  type        = list(string)
  default     = null
}
