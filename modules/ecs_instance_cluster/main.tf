
// Images data source for image_id
# most_recent=true makes images[0] deterministic; no check block needed
data "alibabacloudstack_images" "default" {
  most_recent = true
  owners      = "system"
}



// Instance_types data source for instance_type
data "alibabacloudstack_instance_types" "default" {
  cpu_core_count    = var.cpu_core_count
  memory_size       = var.memory_size
  availability_zone = var.availability_zone != "" ? var.availability_zone : var.vswitch_id != "" ? join("", data.alibabacloudstack_vswitches.default.*.vswitches.0.zone_id) : join("", data.alibabacloudstack_zones.default.*.ids.0)
}



// Zones data source for availability_zone
data "alibabacloudstack_zones" "default" {
  available_resource_creation = "VSwitch"
  enable_details              = true
}



data "alibabacloudstack_vswitches" "default" {
  count   = length(var.vswtich_id) > 0 ? 1 : 0
  zone_id = data.alibabacloudstack_zones.default.zones.0.id
  ids     = [var.vswtich_id]
}


locals {
  disk_category = length(var.disk_category) > 0 ? var.disk_category : data.alibabacloudstack_zones.default.zones.0.available_disk_categories.0
}


resource "alibabacloudstack_vpc" "default" {
  count      = length(var.vpc_id) > 0 ? 0 : 1
  cidr_block = "172.16.0.0/12"
  vpc_name   = var.name
}



resource "alibabacloudstack_vswitch" "this" {
  count        = length(var.vswtich_id) > 0 ? 0 : 1
  vswitch_name = var.name
  zone_id      = data.alibabacloudstack_zones.default.zones.0.id
  vpc_id       = length(var.vpc_id) > 0 ? var.vpc_id : alibabacloudstack_vpc.default.0.id
  cidr_block   = "172.16.0.0/24"
}



resource "alibabacloudstack_security_group" "default" {
  count  = length(var.security_group_ids) > 0 ? 0 : 1
  vpc_id = length(var.vpc_id) > 0 ? var.vpc_id : alibabacloudstack_vpc.default.0.id
  name   = var.name
}



resource "alibabacloudstack_instance" "default" {
  count                         = var.cluster_size
  image_id                      = var.image_id == "" ? data.alibabacloudstack_images.default.images[0].id : var.image_id
  instance_type                 = var.instance_type == "" ? data.alibabacloudstack_instance_types.default.instance_types[0].id : var.instance_type
  security_groups               = length(var.security_group_ids) > 0 ? var.security_group_ids : [alibabacloudstack_security_group.default[0].id]
  instance_name                 = var.cluster_size < 2 ? var.name : format("%s-%s", var.name, count.index + 1)
  host_name                     = var.host_name
  description                   = var.description
  system_disk_category          = local.disk_category
  system_disk_size              = var.system_disk_size
  kms_encrypted_password        = var.kms_encrypted_password
  kms_encryption_context        = var.kms_encryption_context
  password                      = var.password
  vswitch_id                    = length(var.vswtich_id) > 0 ? var.vswtich_id : alibabacloudstack_vswitch.this.0.id
  user_data                     = var.user_data
  role_name                     = var.role_name
  key_name                      = var.key_name
  security_enhancement_strategy = var.security_enhancement_strategy
  tags                          = var.instance_tags
}



resource "alibabacloudstack_eip" "default" {
  count     = 2
  bandwidth = 10
}
