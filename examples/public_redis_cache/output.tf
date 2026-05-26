output "resource_group_name" {
  value = module.resource_group.name
}

output "redis_id" {
  value = module.redis_cache.id
}

output "redis_name" {
  value = module.redis_cache.name
}

output "redis_hostname" {
  value = module.redis_cache.hostname
}

output "redis_database_port" {
  value = module.redis_cache.database_port
}
