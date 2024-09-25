output "resource_group_name" {
  value = module.resource_group.name
}

output "redis_cache_id" {
  value = module.redis_cache.redis_cache_id
}

output "redis_cache_name" {
  value = module.redis_cache.redis_cache_name
}

output "redis_cache_hostname" {
  value = module.redis_cache.redis_cache_hostname
}
