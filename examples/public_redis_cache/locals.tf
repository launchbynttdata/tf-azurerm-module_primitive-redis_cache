locals {
  redis_cache_name    = module.resource_names["redis_cache"].minimal_random_suffix
  resource_group_name = module.resource_names["resource_group"].minimal_random_suffix
}
