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
  description = "Name of the Managed Redis instance."
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

# Managed Redis inputs

variable "sku_name" {
  description = "The SKU of the Managed Redis instance. Examples: Balanced_B1, Balanced_B3, ComputeOptimized_X3, MemoryOptimized_M10."
  type        = string
  default     = "Balanced_B1"
}

variable "high_availability_enabled" {
  description = "Whether to enable high availability for the Managed Redis instance. Defaults to true."
  type        = bool
  default     = true
}

variable "public_network_access" {
  description = "The public network access setting. Possible values are Enabled and Disabled."
  type        = string
  default     = "Disabled"

  validation {
    condition     = contains(["Enabled", "Disabled"], var.public_network_access)
    error_message = "public_network_access must be Enabled or Disabled."
  }
}

variable "identity" {
  description = "Managed identity block. type is required (SystemAssigned, UserAssigned, or both). identity_ids required when UserAssigned."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "customer_managed_key" {
  description = "Customer managed key block for encryption."
  type = object({
    key_vault_key_id          = string
    user_assigned_identity_id = string
  })
  default = null
}

variable "default_database" {
  description = "Default database configuration block for the Managed Redis instance. Required when creating a new Managed Redis."
  type = object({
    access_keys_authentication_enabled            = optional(bool, false)
    client_protocol                               = optional(string, "Encrypted")
    clustering_policy                             = optional(string, "OSSCluster")
    eviction_policy                               = optional(string, "VolatileLRU")
    geo_replication_group_name                    = optional(string)
    persistence_append_only_file_backup_frequency = optional(string)
    persistence_redis_database_backup_frequency   = optional(string)
    modules = optional(list(object({
      name = string
      args = optional(string)
    })))
  })
}

variable "tags" {
  description = "Custom tags for the Managed Redis instance."
  type        = map(string)
  default     = {}
}
