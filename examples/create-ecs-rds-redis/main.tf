
data "alibabacloudstack_zones" "default" {
  available_resource_creation = "Rds"
  enable_details              = true
}



module "ecs" {
  source                        = "../../modules/ecs_instance_cluster"
  cluster_size                  = 1
  name                          = var.name
  host_name                     = var.host_name
  description                   = var.description
  password                      = var.password
  kms_encrypted_password        = var.kms_encrypted_password
  kms_encryption_context        = var.kms_encryption_context
  system_disk_size              = var.system_disk_size
  disk_category                 = var.disk_category
  availability_zone             = var.availability_zone
  image_id                      = var.image_id
  image_name_regex              = var.image_name_regex
  instance_type                 = var.instance_type
  user_data                     = var.user_data
  key_name                      = var.key_name
  security_enhancement_strategy = var.security_enhancement_strategy
}


resource "alibabacloudstack_db_instance" "default" {
  db_instance_description  = var.name
  vswitch_id               = module.ecs.vswitch_id
  db_instance_storage_type = length(var.rds_disk_category) > 0 ? var.rds_disk_category : length(var.disk_category) > 0 ? var.disk_category : data.alibabacloudstack_zones.default.zones.0.available_disk_categories.0
  engine                   = var.engine
  engine_version           = var.engine_version
  db_instance_class        = var.rds_instance_type
  db_instance_storage      = var.instance_storage
  payment_type             = var.instance_charge_type
  monitoring_period        = var.monitoring_period
}



resource "alibabacloudstack_kvstore_instance" "default" {
  vswitch_id     = module.ecs.vswitch_id
  security_ips   = var.security_ips
  instance_type  = var.redis_instance_type
  engine_version = var.redis_engine_version
  zone_id        = length(var.availability_zone) > 0 ? var.availability_zone : data.alibabacloudstack_zones.default.zones.0.id
  instance_class = var.redis_instance_class
}
