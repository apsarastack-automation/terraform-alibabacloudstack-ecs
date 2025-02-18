// Output the ID of the slb and new slb listener created

output "slb_listener_ids" {
  description = "The id of slb listeners"
  value       = alibabacloudstack_slb_listener.default.id
}