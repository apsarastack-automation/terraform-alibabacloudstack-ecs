
module "ecs-cluster" {
  source            = "../../modules/ecs_instance_cluster"
  name              = var.name
  availability_zone = var.zone_id
}