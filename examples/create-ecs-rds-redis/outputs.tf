output "ecs_id" {
  value = length(module.ecs.ids) > 0 ? split(",", module.ecs.ids)[0] : null
}

output "rds_id" {
  value = alibabacloudstack_db_instance.default.id
}

output "vswitch_id" {
  value = module.ecs.vswitch_id
}