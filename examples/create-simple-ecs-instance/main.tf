
data "alibabacloudstack_zones" "default" {
  available_resource_creation = "Instance"
  enable_details              = true
}



data "alibabacloudstack_images" "default" {
  name_regex  = length(var.image_name_regex) > 0 ? var.image_name_regex : ""
  most_recent = true
  owners      = "system"
}



resource "alibabacloudstack_vpc" "default" {
  vpc_name   = var.name
  cidr_block = var.cidr_block
}



resource "alibabacloudstack_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = var.cidr_block
  vpc_id       = alibabacloudstack_vpc.default.id
  zone_id      = data.alibabacloudstack_zones.default.zones.0.id
}



resource "alibabacloudstack_security_group" "default" {
  name   = var.name
  vpc_id = alibabacloudstack_vpc.default.id
}


locals {
  subscription = var.instance_charge_type == "PostPaid" ? {} : var.subscription
}


// ECS Instance Resource for Module
resource "alibabacloudstack_instance" "default" {
  image_id                      = length(var.image_id) > 0 ? var.image_id : data.alibabacloudstack_images.default.images.0.id
  instance_type                 = var.instance_type
  security_groups               = [alibabacloudstack_security_group.default.id]
  vswitch_id                    = alibabacloudstack_vswitch.default.id
  instance_name                 = var.name
  host_name                     = var.host_name
  description                   = var.description
  password                      = var.password
  kms_encrypted_password        = var.kms_encrypted_password
  kms_encryption_context        = var.kms_encryption_context
  system_disk_category          = length(var.system_disk_category) > 0 ? var.system_disk_category : data.alibabacloudstack_zones.default.zones.0.available_disk_categories.0
  system_disk_size              = var.system_disk_size
  private_ip                    = var.private_ip
  internet_max_bandwidth_out    = var.associate_public_ip_address ? var.internet_max_bandwidth_out : 0
  user_data                     = var.user_data
  role_name                     = var.role_name
  key_name                      = var.key_name
  security_enhancement_strategy = var.security_enhancement_strategy
  tags = merge(
    {
      Name = var.name
    },
    var.tags,
  )
  depends_on = [alibabacloudstack_security_group.default]
}



resource "alibabacloudstack_disk_attachment" "default" {
  disk_id     = alibabacloudstack_disk.default.id
  instance_id = alibabacloudstack_instance.default.id
  depends_on  = [alibabacloudstack_instance.default, alibabacloudstack_disk.default]
}



resource "alibabacloudstack_disk" "default" {
  zone_id  = data.alibabacloudstack_zones.default.zones.0.id
  size     = 20
  category = length(var.system_disk_category) > 0 ? var.system_disk_category : data.alibabacloudstack_zones.default.zones.0.available_disk_categories.0
}
