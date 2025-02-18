// Output the IDs of the ECS instances created
output "ids" {
  value = join(",", alibabacloudstack_instance.default.*.id)
}

output "availability_zone" {
  value = alibabacloudstack_instance.default.0.availability_zone
}

output "vswitch_id" {
  value = alibabacloudstack_instance.default.0.vswitch_id
}

output "security_group_ids" {
  value = alibabacloudstack_instance.default.0.security_groups
}

# Key pair outputs
output "key_name" {
  value = alibabacloudstack_instance.default.0.key_name
}

output "image_id" {
  value = alibabacloudstack_instance.default.0.image_id
}

output "instance_type" {
  value = alibabacloudstack_instance.default.0.instance_type
}

output "private_ips" {
  value = alibabacloudstack_instance.default.0.private_ip
}

output "disk_category" {
  value = local.disk_category
}