
resource "alibabacloudstack_slb_acl" "slb_acl" {
  acl_name       = var.name
  address_ip_version = var.ip_version
}
