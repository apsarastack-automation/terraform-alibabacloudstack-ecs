output "slb_acl_id" {
  value = alibabacloudstack_slb_acl.slb_acl.id
}

output "slb_acl_name" {
  value = alibabacloudstack_slb_acl.slb_acl.acl_name
}

output "slb_acl_ip_version" {
  value = alibabacloudstack_slb_acl.slb_acl.address_ip_version
}

output "slb_acl_entry_list" {
  value = alibabacloudstack_slb_acl.slb_acl.entry_list
}