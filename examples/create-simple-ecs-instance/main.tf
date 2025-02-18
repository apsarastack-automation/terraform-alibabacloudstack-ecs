
module "ecs-cluster" {
  source                        = "../../modules/ecs_instance_cluster"
  cluster_size                  = 1
  name                          = var.name
  host_name                     = var.host_name
  description                   = var.description
  password                      = var.password
  kms_encrypted_password        = var.kms_encrypted_password
  kms_encryption_context        = var.kms_encryption_context
  system_disk_size              = var.system_disk_size
  disk_category                 = var.system_disk_category
  availability_zone             = var.availability_zone
  image_id                      = var.image_id
  image_name_regex              = var.image_name_regex
  instance_type                 = var.instance_type
  user_data                     = var.user_data
  key_name                      = var.key_name
  security_enhancement_strategy = var.security_enhancement_strategy
}


resource "alibabacloudstack_disk_attachment" "default" {
  disk_id     = alibabacloudstack_disk.default.id
  instance_id = split(",", module.ecs-cluster.ids).0
  depends_on  = [module.ecs-cluster, alibabacloudstack_disk.default]
}



resource "alibabacloudstack_disk" "default" {
  zone_id  = module.ecs-cluster.availability_zone
  size     = 20
  category = module.ecs-cluster.disk_category
}
