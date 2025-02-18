output "this_availability_zone" {
  description = "The zone id of the instance."
  value       = alibabacloudstack_instance.default.availability_zone
}

// Output the IDs of the ECS instances created
output "this_instance_id" {
  description = "The instance ids."
  value       = alibabacloudstack_instance.default.id
}

output "this_instance_name" {
  description = "The instance names."
  value       = alibabacloudstack_instance.default.instance_name
}

output "this_instance_tags" {
  description = "The tags for the instance."
  value       = alibabacloudstack_instance.default.tags
}

# VSwitch  ID
output "this_vswitch_id" {
  description = "The vswitch id in which the instance."
  value       = alibabacloudstack_instance.default.vswitch_id
}

# Security Group outputs
output "this_security_group_ids" {
  description = "The security group ids in which the instance."
  value       = alibabacloudstack_instance.default.security_groups
}

# Key pair outputs
output "this_key_name" {
  description = "The key name of the instance."
  value       = alibabacloudstack_instance.default.key_name
}

# Ecs instance outputs
output "this_image_id" {
  description = "The image ID used by the instance."
  value       = alibabacloudstack_instance.default.image_id
}

output "this_instance_type" {
  description = "The type of the instance."
  value       = alibabacloudstack_instance.default.instance_type
}

output "this_system_disk_category" {
  description = "The system disk category of the instance."
  value       = alibabacloudstack_instance.default.system_disk_category
}

output "this_system_disk_size" {
  description = "The system disk size of the instance."
  value       = alibabacloudstack_instance.default.system_disk_size
}

output "this_host_name" {
  description = "The host name of the instance."
  value       = alibabacloudstack_instance.default.host_name
}

output "this_private_ip" {
  description = "The private ip of the instance."
  value       = alibabacloudstack_instance.default.private_ip
}

output "this_internet_max_bandwidth_out" {
  description = "The internet max bandwidth out of the instance."
  value       = alibabacloudstack_instance.default.internet_max_bandwidth_out
}

output "this_internet_max_bandwidth_in" {
  description = "The internet max bandwidth in of the instance."
  value       = alibabacloudstack_instance.default.internet_max_bandwidth_in
}