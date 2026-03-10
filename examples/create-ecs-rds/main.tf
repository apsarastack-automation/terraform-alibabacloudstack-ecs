
data "alibabacloudstack_zones" "default" {
  available_resource_creation = "Rds"
  enable_details              = true
}

data "alibabacloudstack_rds_instance_types" "default" {
  engine               = var.engine
  sorted_by            = "CPU"
  engine_version       = var.engine_version
  series               = "dual_ha"
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
  db_instance_storage_type = length(var.rds_disk_category) > 0 ? var.rds_disk_category : length(var.disk_category) > 0 ? var.disk_category : data.alibabacloudstack_rds_instance_types.default.instance_types.0.storage_type
  engine                   = var.engine
  engine_version           = var.engine_version
  db_instance_class        = data.alibabacloudstack_rds_instance_types.default.instance_types.0.id
  db_instance_storage      = data.alibabacloudstack_rds_instance_types.default.instance_types.0.storage_min
  instance_charge_type     = var.instance_charge_type
  monitoring_period        = var.monitoring_period
  cpu_type             = data.alibabacloudstack_rds_instance_types.default.instance_types.0.cpu_type
}
