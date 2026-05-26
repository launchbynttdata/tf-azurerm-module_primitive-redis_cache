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

output "id" {
  value       = azurerm_managed_redis.redis.id
  description = "The ID of the Managed Redis instance."
}

output "hostname" {
  value       = azurerm_managed_redis.redis.hostname
  description = "The DNS hostname of the Managed Redis cluster endpoint."
}

output "name" {
  value       = azurerm_managed_redis.redis.name
  description = "The name of the Managed Redis instance."
}

output "database_id" {
  value       = azurerm_managed_redis.redis.default_database[0].id
  description = "The ID of the default Managed Redis database."
}

output "database_port" {
  value       = azurerm_managed_redis.redis.default_database[0].port
  description = "The TCP port of the default Managed Redis database endpoint."
}

output "primary_access_key" {
  value       = azurerm_managed_redis.redis.default_database[0].primary_access_key
  sensitive   = true
  description = "The primary access key of the default database (only available when access_keys_authentication_enabled=true)."
}

output "secondary_access_key" {
  value       = azurerm_managed_redis.redis.default_database[0].secondary_access_key
  sensitive   = true
  description = "The secondary access key of the default database (only available when access_keys_authentication_enabled=true)."
}
