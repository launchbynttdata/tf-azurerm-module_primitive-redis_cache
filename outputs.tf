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

output "redis_cache_id" {
  value = azurerm_redis_cache.redis.id
}

output "redis_cache_hostname" {
  value = azurerm_redis_cache.redis.hostname
}

output "redis_cache_name" {
  value = azurerm_redis_cache.redis.name
}

output "redis_cache_primary_access_key" {
  value     = azurerm_redis_cache.redis.primary_access_key
  sensitive = true
}

output "redis_cache_secondary_access_key" {
  value     = azurerm_redis_cache.redis.secondary_access_key
  sensitive = true
}

output "redis_cache_primary_connection_string" {
  value     = azurerm_redis_cache.redis.primary_connection_string
  sensitive = true
}

output "redis_cache_secondary_connection_string" {
  value     = azurerm_redis_cache.redis.secondary_connection_string
  sensitive = true
}
